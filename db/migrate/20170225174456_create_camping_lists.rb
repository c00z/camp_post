class CreateCampingLists < ActiveRecord::Migration[5.0]
  def change
    create_table :camping_lists do |t|
      t.string :item
      
      t.timestamps
    end
  end
end
