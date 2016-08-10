class AddImageUrl < ActiveRecord::Migration
  def change
    add_column :stamps, :image_url, :string
    add_column :stamps_raw, :image_url, :string
  end
end
