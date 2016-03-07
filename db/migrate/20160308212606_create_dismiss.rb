class CreateDismiss < ActiveRecord::Migration
  def change
    create_table :dismiss do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
    add_index :dismiss, [:user_id, :course_id], unique: true
  end
end
