class ChangeColumnDefaultToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :total_stay_time, from: nil, to: 0
  end
end
