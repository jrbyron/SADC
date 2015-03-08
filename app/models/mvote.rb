class Mvote < ActiveRecord::Base
  belongs_to :user
  belongs_to :mpost

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }

  after_save :update_post

  def up_vote?
    value == 1
  end

  def down_vote?
    value == -1
  end

  private

  def update_post
    mpost.update_rank
  end
end