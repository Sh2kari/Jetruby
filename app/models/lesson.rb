class Lesson < ActiveRecord::Base
  belongs_to :course

  validates :title, presence: true

  mount_uploader :cover, LessonCoverUploader
end
