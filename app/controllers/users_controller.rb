class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_by_id, only: [:update_role, :destroy]

  def index
    authorize User
    @users = User.all
  end

  def update_role
    authorize @user
    if @user.update(update_role_params)
      render status: :ok, template: 'users/show'
    else
      render status: :unprocessable_entity, json: {errors: @user.errors.full_messages}
    end
  end

  def destroy
    authorize @user
    @user.destroy
  end

  private
  def update_role_params
    params.require(:user).permit(:user_type)
  end

  def set_user_by_id
    @user = User.find(params[:id])
  end
end
