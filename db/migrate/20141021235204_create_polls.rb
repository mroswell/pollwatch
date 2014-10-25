class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :location_name
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    add_index :polls, [:latitude, :longitude]
  end
end
