class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
     t.string :description
     t.string :price
     t.string :image
     t.integer :status
     t.string :sub_category_id
     t.string :shop_id
    
      t.timestamps
    end
  end
end
