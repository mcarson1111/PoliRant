class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      
    t.string :address1, null: false
    t.string :address2
    t.string :city, null: false
    t.string :state, null: false
    t.integer :zip, null: false
    t.integer :user_id

      t.timestamps null: false
    end
  end
end
