class Campsite < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :campsites_users
  has_many :users, through: :campsites_users

end
