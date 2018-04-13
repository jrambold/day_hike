class TripTrails < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_trails do |t|
      t.references :trip, index: true, foreign_key: true
      t.references :trail, index: true, foreign_key: true
      t.timestamps
    end
  end
end
