class Student < ActiveRecord::Base
  has_many :student_classes
  has_many :college_classes, through: :student_classes #when we ask for college_classes for a student,
                                                       #it will do a search on student_classes 
end
