class RemoveUidAndNameFromUserModel < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    remove_column :users, :uid, :string
  end
end
