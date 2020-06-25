class Sight < ApplicationRecord
	validates :title, presence: true
	validates :title, length: { minimum: 2 }
  	validates :content, length: { maximum: 500 }
end
