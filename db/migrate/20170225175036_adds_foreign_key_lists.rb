class AddsForeignKeyLists < ActiveRecord::Migration[5.0]
  def change
    add_reference :camping_lists, :user, foreign_key: true
  end
end
