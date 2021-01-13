class AppointmentSplitDatetimeToDateTime < ActiveRecord::Migration[6.1]
  def change
    change_table :appointments do |t|
      t.change :date, :date
      t.time :time
    end
  end
end
