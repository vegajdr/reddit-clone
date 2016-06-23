class CreateModerators < ActiveRecord::Migration
  def change
    create_table :moderators do |t|
      t.belongs_to :user_id, index: true, foreign_key: true
      t.belongs_to :room_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
