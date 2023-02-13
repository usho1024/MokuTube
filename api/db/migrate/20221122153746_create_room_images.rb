class CreateRoomImages < ActiveRecord::Migration[6.1]
  def change
    create_table :room_images do |t|
      t.string :name, null: false
      t.string :image_name, null: false
      t.integer :number_of_seats, null: false

      t.timestamps
    end
  end
end
