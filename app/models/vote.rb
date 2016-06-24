class Vote < ActiveRecord::Base

  validates_uniqueness_of :user_id, scope: :message_id

  belongs_to :users
  belongs_to :messages
end
