class Room < ActiveRecord::Base
  has_many :messages
  has_many :users, through: :messages

  has_many :moderators
  has_many :users, through: :moderators

  validates_presence_of :category, :name
end
