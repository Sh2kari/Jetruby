class Dismiss < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  validates_uniqueness_of :course_id, scope: :user_id
end
