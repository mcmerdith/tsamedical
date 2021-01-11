class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :fname
      t.string :lname
      t.date :dob
      t.datetime :date
      t.integer :service_id

      t.timestamps
    end
  end
end
