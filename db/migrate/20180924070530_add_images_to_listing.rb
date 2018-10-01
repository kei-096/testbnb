class AddImagesToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :images, :string
  end
end
