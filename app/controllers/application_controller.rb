class ApplicationController < ActionController::API
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    error_message = I18n.t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    render json: {errors: [error_message]}, status: :forbidden
  end
end
