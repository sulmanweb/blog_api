Rails.application.routes.draw do

  scope :api, defaults: {format: 'json'} do
    # user auths
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks],
      controllers: {
        registrations: 'overrides/registrations',
        sessions: 'overrides/sessions',
        token_validations: 'overrides/token_validations',
        passwords: 'overrides/passwords'
      }

    # users paths
    resources :users, only: [:index, :destroy] do
      member do
        # change role
        put :update_role
      end
    end
  end

end
