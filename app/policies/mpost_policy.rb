class MpostPolicy < ApplicationPolicy
  def index?
    user.present? && (user.admin? || user.moderator? || user.member?)
  end

  def destroy?
    user.present? && can_moderate?(user, record)
  end
end