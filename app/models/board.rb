class Board < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :name, presence: true
    validates :body, presence: true
    validates :image, presence: true
end
