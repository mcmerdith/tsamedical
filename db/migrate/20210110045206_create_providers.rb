class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :type
      t.text :description
      t.string :phone
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
