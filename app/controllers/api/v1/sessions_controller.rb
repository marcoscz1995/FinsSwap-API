module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User
                .find_by(email: params["email"])
                .try(:authenticate, params["password"])

        if user
          session[:user_id] = user.id
          render json: {
            status: :created,
            logged_in: true,
            user: user
          }
        else
          check_email_existance = User.find_by(email: params["email"])
          # if the email doesnt exist return this error
          if check_email_existance.present?
            render json: { account_exists: true }, status: 401 
          else
            render json: { account_exists: false }, status: 402
              # status: :not_created,
              # logged_in: false,
              # user: non_existant
            # }
          end
        end

      end
    end
  end
end
