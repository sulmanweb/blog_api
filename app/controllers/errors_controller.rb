class ErrorsController < ApplicationController
  def not_found
    render status: :not_found, json: {errors: [I18n.t('not_found')]}
  end

  def internal_server_error
    render status: :not_found, json: {errors: [I18n.t('internal_server_error')]}
  end
end
