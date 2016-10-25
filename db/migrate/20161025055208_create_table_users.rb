class CreateTableUsers < ActiveRecord::Migration[5.0]
  def change
    create_table "users", force: :cascade do |t|
      t.string  "name"
      t.integer "github_id"
      t.integer "goal_of_commits"
      t.integer "commits"
      t.string  "token"
    end
  end
end
