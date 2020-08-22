module Api
  module V1
  class UsersController < ApplicationController
      def index
        users = User.all
        # runs a simple script when this api is called
        # `python /home/cos/finswap/match-algo/test_rails_python_connection.py`

        render json: UserSerializer.new(users, options).serialized_json
      end

      def show
        user = User.find_by(user_id: params[:user_id])

        render json: UserSerializer.new(user, options).serialized_json
      end

      def create
        user = User.new(user_params)

        # outrageaus hacks
        if user.save
          user.user_id = user.id
          if user.save
            render json: UserSerializer.new(user).serialized_json
          end
        else
          render json: {error: user.errors.messages}, status: 422
        end
      end

      def update 
        user = User.find_by(id: params[:id])

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

      def create_helper
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

      def options
        @options ||= { include: [:owns, :wants] } 
      end
    end
  end
end
