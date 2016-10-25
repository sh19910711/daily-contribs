class CreateTableCommits < ActiveRecord::Migration[5.0]
  def change
    create_table "commits", force: :cascade do |t|
      t.string  "sha"
      t.integer "user_id"
      t.string  "message"
      t.date    "date"
      t.index ["user_id", "sha"], name: "index_commits_on_user_id"
    end
  end
end
