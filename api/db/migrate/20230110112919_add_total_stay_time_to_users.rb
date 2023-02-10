class AddTotalStayTimeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :total_stay_time, :integer
  end
end
