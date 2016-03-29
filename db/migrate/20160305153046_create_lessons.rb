class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.integer :position
      t.text :description
      t.string :cover
      t.text :summary
      t.text :homework
      t.integer :course_id

      t.timestamps null: false
    end

    add_index :lessons, :course_id
  end
end
