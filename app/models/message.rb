class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  has_many :votes

  validates_presence_of :title, :text, :user_id, :room_id
end
