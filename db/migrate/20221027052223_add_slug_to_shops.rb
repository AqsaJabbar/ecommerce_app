class AddSlugToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :slug, :string
    add_index :shops, :slug, unique: true
  end
end
