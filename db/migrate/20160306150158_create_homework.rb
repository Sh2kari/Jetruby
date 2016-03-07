class CreateHomework < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.text :task
      t.string :name
    end
  end
end
