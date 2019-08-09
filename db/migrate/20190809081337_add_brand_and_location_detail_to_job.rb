class AddBrandAndLocationDetailToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :brand, :string
    add_column :jobs, :location, :string
  end
end
