class AddsLocationtoCampsites < ActiveRecord::Migration[5.0]
  def change
    add_column :campsites, :location, :float
  end
end
