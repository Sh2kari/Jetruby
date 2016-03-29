class AddDismissToCourseUsers < ActiveRecord::Migration
  def change
    add_column :course_users, :dismiss, :boolean, default: true
  end
end
