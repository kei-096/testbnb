class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :listing_id
      t.integer :reservation_id
      t.timestamps
    end
  end
end
