class RenameModeratorColumns < ActiveRecord::Migration
  def change
    rename_column :moderators, :user_id_id, :user_id
    rename_column :moderators, :room_id_id, :room_id
  end
end
