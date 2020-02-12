require 'active_record'
require './models/student.rb'
require './models/college_class.rb'
require './models/student_class.rb'
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "mydb.db")

Student.destroy_all
CollegeClass.destroy_all
StudentClass.destroy_all

student = Student.new
student.name = "Frank"
student.email = "frank@sample.com"
student.save

college_class = CollegeClass.new
college_class.name="Algebra"
college_class.instructor="Patel"
college_class.save

student_class = StudentClass.new
student_class.student = Student.find_by(name: "Frank")
student_class.college_class = CollegeClass.find_by(name: "Algebra")
student_class.save

s = Student.all
s.each do |r|
  puts r.name
  puts r.email
  r.college_classes.each do |rr|
    puts rr.name
    puts rr.instructor
  end
end

c = CollegeClass.all
c.each do |r|
  puts r.name
  puts r.instructor
  r.students.each do |rr|
    puts rr.name
    puts rr.email
  end
end
