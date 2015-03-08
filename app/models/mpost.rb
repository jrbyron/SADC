class Mpost < ActiveRecord::Base
  has_many :mcomments, dependent: :destroy
  has_many :mvotes, dependent: :destroy

  belongs_to :user
  belongs_to :mtopic

  default_scope { order('rank DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :mtopic, presence: true
  validates :user, presence: true

  mount_uploader :image, ImageUploader

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
    age = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age

    update_attribute(:rank, new_rank)
  end

  def create_vote
    user.votes.create(value: 1, mpost: self)
  end
end
