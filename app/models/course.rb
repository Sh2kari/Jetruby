class Course < ActiveRecord::Base
  belongs_to :user
  has_many :course_users
  has_many :participants, through: :course_users, source: :user
  has_many :lessons, dependent: :destroy

  scope :recent, -> { order(created_at: :desc) }

  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 40 }

  mount_uploader :cover, CourseCoverUploader
end
