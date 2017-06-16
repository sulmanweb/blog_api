module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    def create
      super do |resource|
        resource.update(user_type: Rails.configuration.constants['user_type_general'])
      end
    end
    protected

        def render_create_error_missing_confirm_success_url
          render json: {
            errors: [I18n.t("devise_token_auth.registrations.missing_confirm_success_url")]
          }, status: 422
        end

        def render_create_error_redirect_url_not_allowed
          render json: {
            errors: [I18n.t("devise_token_auth.registrations.redirect_url_not_allowed", redirect_url: @redirect_url)]
          }, status: 422
        end

        def render_create_success
          render template: "devise/sign_up.json.jbuilder", status: :created
        end

        def render_create_error
          render json: {
            errors: @resource.errors.full_messages
          }, status: 422
        end

        def render_create_error_email_already_exists
          render json: {
            errors: [I18n.t("devise_token_auth.registrations.email_already_exists", email: @resource.email)]
          }, status: 422
        end

        def render_update_success
          render template: "devise/sign_up.json.jbuilder", status: :ok
        end

        def render_update_error
          render json: {
            errors: @resource.errors.full_messages
          }, status: 422
        end

        def render_update_error_user_not_found
          render json: {
            errors: [I18n.t("devise_token_auth.registrations.user_not_found")]
          }, status: 404
        end

        def render_destroy_success
          render json: {
            message: I18n.t("devise_token_auth.registrations.account_with_uid_destroyed", uid: @resource.uid)
          }
        end

        def render_destroy_error
          render json: {
            errors: [I18n.t("devise_token_auth.registrations.account_to_destroy_not_found")]
          }, status: 404
        end

      private
        def validate_post_data which, message
          render json: {
             errors: [message]
          }, status: :unprocessable_entity if which.empty?
        end
  end
end
