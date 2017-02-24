class CreateAddsForiegntoCampsiteUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :campsites_users, :user, foreign_key: true
    add_reference :campsites_users, :campsite, foreign_key: true
  end
end
