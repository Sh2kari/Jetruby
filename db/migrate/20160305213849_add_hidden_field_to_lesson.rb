class AddHiddenFieldToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :hidden, :boolean, default: false
  end
end
