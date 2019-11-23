class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader

  has_many :tasks
  has_many :posts
end
