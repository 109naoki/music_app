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
require 'rails_helper'

RSpec.describe Board, type: :model do
  describe Board do
  #  有効なファクトリを持つこと
    it "Have a valid factory" do
      expect(FactoryBot.build(:board)).to be_valid
    end

  # captionがなければ無効な状態であること
  it "is invalid without an caption" do
    caption = FactoryBot.build(:board, caption: nil)
    caption.valid?
    expect(caption.errors[:caption]).to include("を入力してください")
  end
    # captionが15文字以内であれば投稿できること
     it "Within 15 characters" do
     caption = FactoryBot.build(:board, caption: "a"* 15)
     expect(caption).to be_valid
     end
    # captionが16文字以上であれば投稿できない事
     it "cannot post if it is 16 characters or more" do
     caption = FactoryBot.build(:board, caption: "a"* 16)
     caption.valid?
     expect(caption.errors[:caption]).to include("は15文字以内で入力してください")
     end
  end
end
