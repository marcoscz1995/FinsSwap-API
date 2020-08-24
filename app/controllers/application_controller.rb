class ApplicationController < ActionController::API
  # skip_before_action :verify_authenticity_token
  def execute_statement(sql)
    results = ActiveRecord::Base.connection.execute(sql)

    if results.present?
      return results
    else
      return nil
    end
  end
end
