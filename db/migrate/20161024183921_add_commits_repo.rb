class AddCommitsRepo < ActiveRecord::Migration[5.0]
  def change
    add_column :commits, :repo_id, :integer
    add_column :commits, :message, :string
  end
end
