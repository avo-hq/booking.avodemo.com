class AddSlugsToRoomsAndLocations < ActiveRecord::Migration[8.0]
  def change
    add_column :rooms, :slug, :string
    add_column :locations, :slug, :string

    add_index :rooms, :slug, unique: true
    add_index :locations, :slug, unique: true
  end
end
