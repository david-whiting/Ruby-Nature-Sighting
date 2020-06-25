class AddIdToSights < ActiveRecord::Migration[6.0]
  def change
    add_column :sights, :user_id, :integer
  end
end
