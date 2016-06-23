class Moderator < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  validates_uniqueness_of :user_id, scope: :room_id
  validates_presence_of :user_id, :room_id
end
