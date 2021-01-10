class LinkServiceProvider < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :provider_id, :integer
    add_foreign_key :services, :providers
  end
end
