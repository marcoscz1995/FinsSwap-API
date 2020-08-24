module Api
  module V1
  class MatchesController < ApplicationController

      def show
        # get all the cycle ids that the user is in
        users_cycles = Match.select(:cycle_id).where(user_id: params[:user_id])
        # get all the cycles that the user is in
        all_cycles_involved = Match.where(cycle_id: users_cycles)

        #this is the query that started it all
#        matches = execute_statement("select m.* from matches m join ( select * from matches where user_id = 10 ) c on m.cycle_id = c.cycle_id")
        render json: MatchSerializer.new(all_cycles_involved).serialized_json
      end

    end
  end
end
