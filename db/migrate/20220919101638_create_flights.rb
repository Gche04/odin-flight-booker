class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|

      t.string :airline
      t.integer :arrival_airport_id
      t.integer :departure_airport_id
      t.datetime :flight_time
      t.string :flight_duration

      t.timestamps
    end
  end
end