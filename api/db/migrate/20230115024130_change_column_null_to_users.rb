class ChangeColumnNullToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :total_stay_time, false, 0
  end
end
