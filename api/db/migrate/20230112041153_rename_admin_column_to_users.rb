class RenameAdminColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :admin, :guest
  end
end
