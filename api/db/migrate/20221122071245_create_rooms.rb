class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :room_image_id, null: false
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :bgm_name, null: false
      t.string :bgm_url, null: false

      t.timestamps
    end
  end
end
