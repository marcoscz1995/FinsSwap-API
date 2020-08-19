module Api
  module V1
    class WantsController < ApplicationController

      def create
        want = Want.new(want_params)

        if want.save
          render json: WantSerializer.new(want).serialized_json
        else
          render json: {error: want.errors.messages}, status: 422
        end
      end

      def destroy 
        want = Want.find(params[:id])

        if want.destroy
          head :no_content
        else
          render json: {error: want.errors.messages}, status: 422
        end
      end

      private

      def want_params
        params.require(:want).permit(:user_id, :course_code)
      end
    end
  end
end
