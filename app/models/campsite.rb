class Campsite < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :campsites_users
  has_many :users, through: :campsites_users

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

end
