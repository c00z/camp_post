class CampsitesUser < ApplicationRecord
  belongs_to :user
  belongs_to :campsite

end
