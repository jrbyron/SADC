class Mtopic < ActiveRecord::Base
  has_many :mposts, dependent: :destroy

  default_scope { order('created_at DESC') }
end
