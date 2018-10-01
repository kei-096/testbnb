class AddColumnToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :price, :integer
  end
end
