class Vote < ActiveRecord::Base

  validates_uniqueness_of :user_id, scope: :message_id, message: "Only one vote per message"

  belongs_to :user
  belongs_to :message
  belongs_to :comment
end
