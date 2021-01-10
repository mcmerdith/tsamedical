class AddTypeToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :type, :string
  end
end
