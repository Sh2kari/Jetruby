class Lesson < ActiveRecord::Base
  belongs_to :course
  has_many :homeworks

  validates :title, presence: true

  scope :visible, -> { where(hidden: false) }

  mount_uploader :cover, LessonCoverUploader
end
