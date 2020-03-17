require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"   
set :database, { adapter: "sqlite3", database: "mydb.db" }
require './models/student'
require './models/college_class'
require './models/student_class'

get '/' do   
  Student.all.to_yaml + CollegeClass.all.to_yaml + StudentClass.all.to_yaml
end

get '/s' do
   @students_array = Student.all 
  erb:student_search 
end


get '/display_student/:id' do   #
  @student = Student.find(params[:id])
  if @student.nil? 
    reuturn "Student not found"  
  end  
  erb:student_display
end



get '/ac' do
  @classes_array=CollegeClass.all
  erb:class_search
end

get '/display_class/:id' do
  @specific_class=CollegeClass.find(params[:id])
  if @specific_class.nil?
     return "That class does not exist"
  end
  erb:class_display
end