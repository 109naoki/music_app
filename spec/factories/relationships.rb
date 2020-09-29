# == Schema Information
#
# Table name: relationships
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  followed_id :integer
#  follower_id :integer
#
FactoryBot.define do
  factory :relationship do
    follower_id 1
    followed_id 1
  end
end
