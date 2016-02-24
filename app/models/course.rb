class Course < ActiveRecord::Base
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { minimum: 10 }

  mount_uploader :cover, CourseCoverUploader
end
