class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :campsites_users
  has_many :campsites, through: :campsites_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
