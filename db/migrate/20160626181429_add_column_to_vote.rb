class AddColumnToVote < ActiveRecord::Migration
  def change
    add_column :votes, :comment_id, :integer
  end
end
