class SubCategory < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :category
    has_many :products, dependent: :destroy
end
