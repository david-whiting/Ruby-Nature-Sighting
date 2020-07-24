class AddLocationAndUserIdToSightCats < ActiveRecord::Migration[6.0]
  def change
    add_column :sight_cats, :location, :string
  end
end
