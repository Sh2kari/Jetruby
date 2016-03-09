class CreateDismisses < ActiveRecord::Migration
  def change
    create_table :dismisses do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
    add_index :dismisses, [:user_id, :course_id], unique: true
  end
end
