class RenameBgmUrlColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :bgm_url, :bgm_resource
  end
end
