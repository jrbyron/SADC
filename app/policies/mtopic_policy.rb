class MtopicPolicy < ApplicationPolicy
  def index?
    user.present? && (user.admin? || user.moderator? || user.member?)
  end

  def create?
    user.present? && (user.admin? || user.moderator?)
  end

  def update?
    create?
  end

  def destroy?
    user.present? && (user.admin? || user.moderator?)
  end
  
  def show?
    index?
  end
end