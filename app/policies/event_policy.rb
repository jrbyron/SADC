class EventPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
  	user.admin?
  end

  def new?
  	create?
  end

  def update?
    create?
  end
end