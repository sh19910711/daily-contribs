class AddReferenceToCommitsUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :commits, :user, index: true
  end
end
