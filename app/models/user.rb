class User < ApplicationRecord
  has_secure_password

  has_many :purchased_courses
  has_many :courses, through: :purchased_courses
end
