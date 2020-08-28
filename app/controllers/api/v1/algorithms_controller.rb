module Api
  module V1
  class AlgorithmsController < ApplicationController

    #reads the one row in the algorithm database that is psuedo flag that is true when the swap.py algorithm is run.
      def index
        algo = Algorithm.all

        render json: AlgorithmSerializer.new(algo).serialized_json
      end

    end
  end
end
