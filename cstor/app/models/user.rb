class User < ActiveRecord::Base
  has_many :resources, foreign_key: :teacher_id
  has_many :likes, foreign_key: :liker_id
  has_many :liked_resources, through: :likes, source: :resource

  has_secure_password

  validates :username, :email, presence: true
  validates :email, uniqueness: true
end
