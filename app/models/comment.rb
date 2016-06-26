class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :message

  has_many :votes
end
