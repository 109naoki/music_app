class Board < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :name, presence: true, length: {maximum: 12}
    validates :body, presence: true
    validates :image, presence: true
end
