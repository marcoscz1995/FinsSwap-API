module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all

        UserSerializer.new
      end
    end
  end
end
