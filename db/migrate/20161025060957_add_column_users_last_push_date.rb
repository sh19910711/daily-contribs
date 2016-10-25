class AddColumnUsersLastPushDate < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_push_date, :datetime
  end
end
