class CreateSightCats < ActiveRecord::Migration[6.0]
  def change
    create_table :sight_cats do |t|
      t.integer :category_id
      t.integer :sight_id
      t.timestamps
    end
  end
end
