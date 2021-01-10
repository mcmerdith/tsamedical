class ChangeTypeToServiceTypeProvider < ActiveRecord::Migration[6.1]
  def change
    rename_column :providers, :type, :service_type
  end
end
