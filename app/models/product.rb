class Product < ApplicationRecord
  has_rich_text :description
  extend FriendlyId
  friendly_id :title, use: :slugged
    mount_uploader :image, ImageUploader
    belongs_to :shop
    belongs_to :sub_category
    has_many :cart_items
    enum status: [
        :available,
        :not_available,
        :available_on_order
      ]
end
