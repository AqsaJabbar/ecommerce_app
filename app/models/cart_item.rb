class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  def total_price(product,quantity) 
    total = quantity * product.price.to_i 
    
  end
end
