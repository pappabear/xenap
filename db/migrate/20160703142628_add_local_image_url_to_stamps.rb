class AddLocalImageUrlToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :local_image_url, :string
    add_column :stamps_raw, :local_image_url, :string
  end
end
