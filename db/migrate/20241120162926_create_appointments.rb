class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time
      t.integer :rating
      t.text :notes
      t.references :coach, null: false, foreign_key: { to_table: :users }
      t.references :student, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
