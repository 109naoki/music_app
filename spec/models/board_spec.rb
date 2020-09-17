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
require 'rails_helper'

RSpec.describe Board, type: :model do
  it "is invalid without a name" do
     user = Board.new(name: nil)
     user.valid?
     expect(user.errors[:name]).to include("can't be blank")
     end
  it "is invalid without a title" do
     user = Board.new(title: nil)
     user.valid?
     expect(user.errors[:body]).to include("can't be blank")
     end
  it "is invalid without a image" do
     user = Board.new(image: nil)
     user.valid?
     expect(user.errors[:image]).to include("can't be blank")
     end
    end
