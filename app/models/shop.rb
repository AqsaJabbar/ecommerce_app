class Shop < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    belongs_to :user
    has_many :products, dependent: :destroy
end
