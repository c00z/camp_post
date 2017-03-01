class Review < ApplicationRecord

  validates :title, presence: true, length: {minimum: 1, maximum: 200}
  validates :description, presence: true, length: {minimum: 1, maximum: 2000}

  belongs_to :user
  belongs_to :campsite
end
