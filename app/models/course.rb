class Course < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { minimum: 10 }
end
