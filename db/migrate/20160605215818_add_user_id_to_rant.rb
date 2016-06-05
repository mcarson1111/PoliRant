class AddUserIdToRant < ActiveRecord::Migration
  def change
    remove_column :rants, :uid, :string

    add_column :rants, :user_id, :string
  end
end
