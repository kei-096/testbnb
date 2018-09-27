class AddImagesToListings < ActiveRecord::Migration[5.2]
  def change
  	remove_column :listings, :images
    add_column :listings, :images, :json
  end
end
