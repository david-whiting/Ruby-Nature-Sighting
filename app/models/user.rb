class User < ApplicationRecord
  has_many :sights, dependent: :destroy
  has_secure_password

  validates :email, presence: true, uniqueness: true, length: { minimum: 6 }, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence: true

    def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end

end

