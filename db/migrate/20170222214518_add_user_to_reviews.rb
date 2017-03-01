class AddUserToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :user, foreign_key: true
    add_reference :reviews, :campsite, foreign_key: true
  end
end
