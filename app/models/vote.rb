class Vote < ActiveRecord::Base

  validates_uniqueness_of :user_id, scope: :message_id
  validates_uniqueness_of :user_id, scope: :comment_id

  belongs_to :user
  belongs_to :message
  belongs_to :comment
end
