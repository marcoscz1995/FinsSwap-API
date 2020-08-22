module Api
  module V1
  class MatchesController < ApplicationController

      def show
        matches = Match.where(user_id: params[:user_id])

        render json: MatchSerializer.new(matches).serialized_json
      end

    end
  end
end
