class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :uid, null: false
      t.text :rant, null: false

      t.timestamps null: false
    end
  end
end
