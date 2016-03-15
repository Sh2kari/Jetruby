class Lesson < ActiveRecord::Base
  include AASM

  belongs_to :course
  has_many :homeworks

  validates :title, presence: true

  mount_uploader :cover, LessonCoverUploader

  aasm column: :state do
    state :lesson_waiting, initial: true
    state :homework_waiting
    state :homework_uploaded

    event :homework_wait do
      transitions from: :lesson_waiting, to: :homework_waiting
    end

    event :homework_upload do
      transitions from: :homework_waiting, to: :homework_uploaded
    end
  end
end
