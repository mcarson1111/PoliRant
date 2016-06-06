class AddAddressIdToRants < ActiveRecord::Migration
  def change
    add_column :rants, :address_id, :integer
  end
end
