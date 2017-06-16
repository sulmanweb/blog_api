Rails.application.routes.draw do

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

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

    # Articles
    resources :articles do
      member do
        # Change status
        put :change_status
      end
    end
  end

end
