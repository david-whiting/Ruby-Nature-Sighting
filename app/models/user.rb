class User < ApplicationRecord
  has_many :sights, dependent: :destroy
  has_secure_password

  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, presence: true
  validates :password, length: { minimum: 2 }
end

