class Course < ActiveRecord::Base

  scope :recent, -> { order(created_at: :desc) }

  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { minimum: 10 }

  mount_uploader :cover, CoverUploader
end
