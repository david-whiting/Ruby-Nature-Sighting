class Category < ApplicationRecord
  has_many :sight_cats
  has_many :sights, through: :sight_cats
end