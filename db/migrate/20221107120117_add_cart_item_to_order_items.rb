class AddCartItemToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_items, :cart_item, null: false, foreign_key: true
  end
end
