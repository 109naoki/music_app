# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  caption    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Board < ApplicationRecord
  validates :caption, presence: true, length:{ maximum: 15}
  has_one_attached :avatar
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy

  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :photos

  def liked_by(current_user)
    Like.find_by(user_id: current_user.id, board_id: id)
  end
end
