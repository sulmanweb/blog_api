class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def update_role?
    user.admin?
  end

  def destroy?
    user.admin? or user == record
  end
end
