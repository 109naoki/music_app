# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  image      :string(255)
#  name       :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Board < ApplicationRecord
    belongs_to:user
    has_many :comments
    mount_uploader :image, ImageUploader
    validates :name, presence: true, length: {maximum: 12}
    validates :body, presence: true
    validates :image, presence: true
end
