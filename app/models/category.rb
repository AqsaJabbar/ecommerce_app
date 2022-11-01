class Category < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :sub_categories, dependent: :destroy
end
