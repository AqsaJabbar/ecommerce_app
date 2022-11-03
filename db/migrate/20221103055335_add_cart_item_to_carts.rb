class AddCartItemToCarts < ActiveRecord::Migration[6.0]
  def change
    add_reference :carts, :cart_item, null: false, foreign_key: true
  end
end
