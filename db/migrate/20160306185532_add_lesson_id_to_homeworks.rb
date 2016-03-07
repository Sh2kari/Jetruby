class AddLessonIdToHomeworks < ActiveRecord::Migration
  def change
    add_column :homeworks, :lesson_id, :integer, null: false
    add_index  :homeworks, :lesson_id
  end
end
