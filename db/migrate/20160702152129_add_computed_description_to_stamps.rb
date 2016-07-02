class AddComputedDescriptionToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :computed_description, :string
  end
end
