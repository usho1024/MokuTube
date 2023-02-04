class RemoveGuestAndIsDeleatedFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :guest, :boolean
    remove_column :users, :is_deleated, :boolean
  end
end
