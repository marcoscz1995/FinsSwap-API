module Api
  module V1
    class OwnsController < ApplicationController

      def create
        own = Own.new(own_params)

        if own.save
          render json: OwnSerializer.new(own).serialized_json
        else
          render json: {error: own.errors.messages}, status: 422
        end
      end

      def destroy 
        own = Own.find(params[:id])

        if own.destroy
          head :no_content
        else
          render json: {error: own.errors.messages}, status: 422
        end
      end

      private

      def own_params
        params.require(:own).permit(:user_id, :course_code, :event_date, :start_time, :end_time)
      end
    end
  end
end
