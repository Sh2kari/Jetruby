class Homework < ActiveRecord::Base
  belongs_to :lesson

  validates :task, presence: true
  validates :name, presence: true
end
