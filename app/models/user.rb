class User < ApplicationRecord
  has_secure_password

  validates :fullname, presence: true
  validates :fullname, length: { minimum: 2 }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :pic, presence: true 

  mount_uploader :pic, ImageUploader
end
