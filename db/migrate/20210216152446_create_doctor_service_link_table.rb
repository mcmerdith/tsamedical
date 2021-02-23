class CreateDoctorServiceLinkTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :doctors, :services
  end
end
