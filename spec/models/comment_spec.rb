# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_board_id  (board_id)
#  index_comments_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:board) { FactoryBot.create(:board) }
  let(:comment) { FactoryBot.create(:comment) }

  # 有効なファクトリを持つこと
  it "Have a valid factroy" do
    expect(FactoryBot.build(:comment)).to be_valid
  end

  # user_idがあればコメントが有効であること
  it "Must user_id " do
    expect(comment).to be_valid
  end
  # user_idが無ければコメントが無効であること
  it "Invalid without user ID" do
   comment.user_id = nil
   expect(comment).to be_invalid
  end
  # commentが15文字以内であれば投稿できること
     it "Within 15 characters" do
     comment.comment = "a" * 15
     expect(comment).to be_valid
     end
  # commentが16文字以上であれば投稿できないこと
     it "If the comment is 16 characters or more, it is invalid" do
     comment.comment = "a" * 16
     expect(comment).to be_invalid
     end
  # commentがなければ無効であること
  it "Invalid widhout commnet" do
    comment.comment = nil
    expect(comment).to be_invalid
  end
end
