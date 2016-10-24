class AddCommitsDate < ActiveRecord::Migration[5.0]
  def change
    add_column :commits, :date, :date
  end
end
