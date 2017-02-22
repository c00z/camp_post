class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :campsites, through: :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
