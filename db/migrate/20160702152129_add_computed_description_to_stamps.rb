class AddComputedDescriptionToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :computed_description, :string
    add_column :stamps_raw, :computed_description, :string
  end
end
