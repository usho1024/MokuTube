class AddNotnullToUsersV2 < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :introduction, :string, default: "", null: false
  end
end
