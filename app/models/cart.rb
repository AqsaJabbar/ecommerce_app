class Cart < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    def total
        @sum=0
        cart_items.each do |i| @sum = @sum + (i.total).to_i
        end
        return @sum
    end
end
