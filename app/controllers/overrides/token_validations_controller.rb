module Overrides
  class TokenValidationsController < DeviseTokenAuth::TokenValidationsController
    protected
    def render_validate_token_success
      render status: :ok, template: 'devise/sign_in.json.jbuilder'
    end

    def render_validate_token_error
      render json: {
        errors: [I18n.t("devise_token_auth.token_validations.invalid")]
      }, status: 401
    end
  end
end
