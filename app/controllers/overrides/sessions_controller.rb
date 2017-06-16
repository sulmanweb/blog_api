module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController
    protected

    def render_new_error
      render json: {
        errors: [ I18n.t("devise_token_auth.sessions.not_supported")]
      }, status: 405
    end

    def render_create_success
      render template: "devise/sign_in.json.jbuilder", status: :ok
    end

    def render_create_error_not_confirmed
      render json: {
        errors: [ I18n.t("devise_token_auth.sessions.not_confirmed", email: @resource.email) ]
      }, status: 401
    end

    def render_create_error_bad_credentials
      render json: {
        errors: [I18n.t("devise_token_auth.sessions.bad_credentials")]
      }, status: 401
    end

    def render_destroy_success
      render json: {
        message: I18n.t("devise_token_auth.log_off_success")
      }, status: 200
    end

    def render_destroy_error
      render json: {
        errors: [I18n.t("devise_token_auth.sessions.user_not_found")]
      }, status: 404
    end
  end
end
