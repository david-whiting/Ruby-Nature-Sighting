class Sight < ApplicationRecord
	belongs_to :user, optional: true
    has_many :sight_cats
    has_many :categories, through: :sight_cats

	validates :title, presence: true
	validates :title, length: { minimum: 2 }
  	validates :content, length: { maximum: 500 }
end
