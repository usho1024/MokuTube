class AddNotnullToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :work, :string, default: "", null: false
  end
end
