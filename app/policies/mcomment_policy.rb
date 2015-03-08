class McommentPolicy < ApplicationPolicy
  def destroy?
    user.present? && can_moderate?(user, record)
  end
end