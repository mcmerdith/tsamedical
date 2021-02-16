class AddConfirmedToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :confirmed, :boolean
  end
end
