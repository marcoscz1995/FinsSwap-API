module Api
  module V1
  class MatchesController < ApplicationController
      def index
        matches = User.all

        render json: UserSerializer.new(users, options).serialized_json
      end

      def show
        user = User.find_by(user_id: params[:user_id])

        render json: UserSerializer.new(user, options).serialized_json
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: UserSerializer.new(user).serialized_json
        else
          render json: {error: user.errors.messages}, status: 422
        end
      end

      def update 
        user = User.find_by(user_id: params[:user_id])

        if user.update(user_params)
          render json: UserSerializer.new(user, options).serialized_json
        else
          render json: {error: user.errors.messages}, status: 422
        end
      end

      def destroy 
        user = User.find_by(user_id: params[:user_id])

        if user.destroy
          head :no_content
        else
          render json: {error: user.errors.messages}, status: 422
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :user_id)
      end

      def options
        @options ||= { include: [:owns, :wants] } 
      end
    end
  end
end