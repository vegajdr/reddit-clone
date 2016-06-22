class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :text
      t.integer :user_id
      t.integer :room_id

      t.timestamps null: false
    end
  end
end
