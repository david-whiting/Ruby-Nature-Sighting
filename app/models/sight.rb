class Sight < ApplicationRecord
	belongs_to :user, optional: true
    has_many :sight_cats
    has_many :categories, through: :sight_cats
    accepts_nested_attributes_for :sight_cats

	validates :title, presence: true
	validates :title, length: { minimum: 2 }
  	validates :content, length: { maximum: 500 }

  	scope :search_category, -> (category_name) { 
    joins(sight_cats: :category).where("name LIKE ?", "%#{category_name}%")
  }

    def sight_cats_attributes=(sight_cat_attributes)
    sight_cat_attributes.values.each do |sight_cat_attribute|
      sight_cat = SightCat.find_or_create_by(sight_cat_attribute)
      self.sight_cats << sight_cat
    end
  end
end


