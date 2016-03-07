class Lesson < ActiveRecord::Base
  belongs_to :course
  has_many :homeworks

  validates :title, presence: true

  mount_uploader :cover, LessonCoverUploader
end
