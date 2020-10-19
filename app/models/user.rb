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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name,length: { maximum: 6 }

  has_one_attached :avatar
  has_many :comments
  has_many :likes
  has_many :boards, dependent: :destroy


  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得

  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         validates :profile,length: { maximum: 200 }
         validates :email, presence: true


         def update_without_current_password(params, *options)
          params.delete(:current_password)

          if params[:password].blank? && params[:password_confirmation].blank?
            params.delete(:password)
            params.delete(:password_confirmation)
          end

          result = update_attributes(params, *options)
          clean_up_passwords
          result
        end

         def self.guest
         find_or_create_by!(email: 'guest@example.com') do |user|
         user.password = SecureRandom.urlsafe_base64
        # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
         end
        end

        # ユーザーをフォローする
        def follow(user_id)
        follower.create(followed_id: user_id)
        end

        # ユーザーのフォローを外す
        def unfollow(user_id)
        follower.find_by(followed_id: user_id).destroy
        end

        # フォローしていればtrueを返す
        def following?(user)
        following_user.include?(user)
        end
   end
