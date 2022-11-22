class CreateRoomsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms_users do |t|
      t.integer :room_id, null: false
      t.integer :user_id, null: false
      t.string :work
      t.integer :seat_number, null: false
      t.integer :x_coord, null: false
      t.integer :y_coord, null: false

      t.timestamps
    end
  end
end
