class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :election_id
      t.text :problems
      t.text :comment
      t.string :contact_method
      t.time :time_happened
      t.date :election_year

      t.belongs_to :poll, index: true
      t.timestamps
    end
  end
end
