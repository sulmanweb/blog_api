module Overrides
  class PasswordsController < DeviseTokenAuth::PasswordsController
    protected
    def render_create_error_missing_email
      render json: {
        errors: [I18n.t("devise_token_auth.passwords.missing_email")]
      }, status: 401
    end

    def render_create_error_missing_redirect_url
      render json: {
        errors: [I18n.t("devise_token_auth.passwords.missing_redirect_url")]
      }, status: 401
    end

    def render_create_error_not_allowed_redirect_url
      render json: {
        errors: [I18n.t("devise_token_auth.passwords.not_allowed_redirect_url", redirect_url: @redirect_url)]
      }, status: 422
    end

    def render_create_success
      render json: {
        message: I18n.t("devise_token_auth.passwords.sended", email: @email)
      }
    end

    def render_create_error
      render json: {
        errors: @errors.full_messages,
      }, status: @error_status
    end

    def render_edit_error
      raise ActionController::RoutingError.new('Not Found')
    end

    def render_update_error_unauthorized
      render json: {
        errors: ['Unauthorized']
      }, status: 401
    end

    def render_update_error_password_not_required
      render json: {
        errors: [I18n.t("devise_token_auth.passwords.password_not_required", provider: @resource.provider.humanize)]
      }, status: 422
    end

    def render_update_error_missing_password
      render json: {
        errors: [I18n.t("devise_token_auth.passwords.missing_passwords")]
      }, status: 422
    end

    def render_update_success
      render json: {
        message: I18n.t("devise_token_auth.passwords.successfully_updated")
      }
    end

    def render_update_error
      return render json: {
        errors: resource_errors.full_messages
      }, status: 422
    end
  end
end
