class Board < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :name, presence: true
    validates :title, presence: true
    validates :image, presence: true
end
