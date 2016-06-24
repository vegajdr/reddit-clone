class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :votes

  has_many :messages
  has_many :rooms, through: :messages

  has_many :moderators
  has_many :rooms, through: :moderators



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
