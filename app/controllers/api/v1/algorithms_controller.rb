module Api
  module V1
  class AlgorithmsController < ApplicationController

      def index
        algo = Algorithm.all

        render json: AlgorithmSerializer.new(algo).serialized_json
      end

    end
  end
end
