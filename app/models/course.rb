class Course < ActiveRecord::Base
  belongs_to :user
  has_many :course_users
  has_many :participants, through: :course_users, source: :user
  has_many :lessons, dependent: :destroy
  has_many :dismiss, dependent: :destroy
  has_many :bans, through: :dismiss, source: :user, dependent: :destroy

  scope :recent, -> { order(created_at: :desc) }

  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 40 }

  mount_uploader :cover, CourseCoverUploader

  def ban_for?(user)
    bans.exists?(user_id: user.id)
  end
end
