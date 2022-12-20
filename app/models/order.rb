class Order < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    belongs_to :user
    has_many :order_items, dependent: :destroy
end
