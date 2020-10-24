# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  name                   :string(255)      default(""), not null
#  profile                :text(65535)
#  profile_photo          :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User do
  #有効なファクトリを持つこと
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  #メールアドレスが無ければ無効な状態であること
  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  #メールアドレスが50文字以内であれば有効であること
  it "Valid if the email address is 50 characters or less" do
    user = FactoryBot.build(:user, email: "#{"a" * 38}@example.com")
    expect(user).to be_valid
  end

  #メールアドレスが51文字以上であれば無効であること
  it "If the email address is 51 characters or more, it is invalid" do
    user = FactoryBot.build(:user, email: "#{"a" * 39}@example.com")
    user.valid?
    expect(user.errors[:email]).to include("は50文字以内で入力してください")
    end

  #パスワードが無ければ無効な状態であること
  it "is invalid without an email password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  # パスワードが6文字以上であれば有効であること
  it "Must be valid if the password is 6 characters or more" do
      user = FactoryBot.build(:user, password: "a" * 6)
      expect(user).to be_valid
    end
  # パスワードが5文字以内だと無効であること
    it "The password is invalid if it is within 5 characters" do
      user = FactoryBot.build(:user, password: "a" * 5)
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  # ユーザーの名前を文字列として返すこと
  it "return a use's name as a string" do
    user = FactoryBot.build(:user, name: "Bob")
    expect(user.name).to eq "Bob"
  end
  # ユーザーの名前が8字以内であれば有効であること
  it "Valid if the user's name is 8 characters or less" do
      user = FactoryBot.build(:user, name: "a" * 7)
      expect(user).to be_valid
    end
 # ユーザーの名前が9字以上であれば無効であること
    it "Invalid if the user's name is 8 characters or more" do
      user = FactoryBot.build(:user, name: "a" * 9)
      user.valid?
      expect(user.errors[:name]).to include("は8文字以内で入力してください")
    end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a dupulicate email address" do
    FactoryBot.create(:user, email: "test@example.com")
    user = FactoryBot.build(:user, email: "test@example.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end



end
