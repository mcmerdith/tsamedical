class AddProfilePictureUrlToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :profile_picture_url, :string
  end
end
