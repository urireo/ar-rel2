class CollegeClass < ActiveRecord::Base
  has_many :student_classes #relationship table
  has_many :students, through: :student_classes
end
