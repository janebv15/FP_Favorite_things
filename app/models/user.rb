# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  bio                    :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  upload_image           :string
#  username               :string
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
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :favorite_things, class_name: "FavoriteThing", foreign_key: "user_id", dependent: :destroy

  has_many  :sent_requests, class_name: "FollowRequestsJoinTable", foreign_key: "sender_id", dependent: :destroy

  has_many  :recieved_requests, class_name: "FollowRequestsJoinTable", foreign_key: "recipient_id", dependent: :destroy

  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  belongs_to :category, required: true, class_name: "Category", foreign_key: "category_id", counter_cache: true

  validates :category_id, presence: true

  has_many  :favorite_things, class_name: "FavoriteThing", foreign_key: "category_id", dependent: :destroy

  belongs_to :sender, required: true, class_name: "User", foreign_key: "sender_id"

  belongs_to :recipient, required: true, class_name: "User", foreign_key: "recipient_id"
end
