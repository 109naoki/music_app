# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  image      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#
# Indexes
#
#  index_photos_on_board_id  (board_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#
# require 'rails_helper'
# RSpec.describe Photo, type: :model do
#     it "有効なファクトリを持つこと" do
#       expect(FactoryBot.build(:photo)).to be_valid
#     end
#   end
