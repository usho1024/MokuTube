class AddWorkToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :work, :string
  end
end
