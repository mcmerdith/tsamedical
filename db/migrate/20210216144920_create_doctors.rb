class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.date :date_registered
      t.string :service_type
      t.integer :provider_id

      t.timestamps
    end
    add_foreign_key :doctors, :providers
  end
end
