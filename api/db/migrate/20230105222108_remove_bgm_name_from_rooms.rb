class RemoveBgmNameFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :bgm_name, :string
  end
end
