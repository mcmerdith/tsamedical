class ChangeTypeToServiceType < ActiveRecord::Migration[6.1]
  def change
    rename_column :services, :type, :service_type
  end
end
