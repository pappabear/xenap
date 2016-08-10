class AddHashToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :stamp_hash, :string
    add_column :stamps_raw, :stamp_hash, :string
  end
end
