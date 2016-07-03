class AddLocalImageUrlToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :local_image_url, :string
  end
end
