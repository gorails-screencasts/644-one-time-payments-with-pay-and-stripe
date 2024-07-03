class Course < ApplicationRecord
  has_many :purchased_courses
  has_many :purchasers, through: :purchased_courses, source: :user
end
