class SightCat < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :sight, optional: true
end

