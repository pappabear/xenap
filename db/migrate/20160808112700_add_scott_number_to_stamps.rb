class AddScottNumberToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :scott_number, :string
    add_column :stamps_raw, :scott_number, :string
  end
end
