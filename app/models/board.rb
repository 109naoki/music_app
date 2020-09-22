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
  belongs_to :user
  has_many :photos, dependent: :destroy

  
  accepts_nested_attributes_for :photos

   
end
