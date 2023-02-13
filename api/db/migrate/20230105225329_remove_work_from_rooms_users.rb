class RemoveWorkFromRoomsUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms_users, :work, :string
  end
end
