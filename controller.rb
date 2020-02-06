require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('./models/student')
require_relative('./models/house')
also_reload('./models/*')

get '/students' do
  @students = Student.all()
  erb(:students)
end

get '/students/new' do
  @houses = House.all()
  erb(:new)
end

post '/students' do
  @student = Student.new(params)
  @student.save
  erb(:create)
end

get '/students/sort' do
  @houses = House.all()
  erb(:sort)
end

get '/students/sort/house' do
  @houses = House.all()
  erb(:sorted_house)
end

get '/students/:id' do
  @student = Student.find(params[:id])
  erb(:student)
end

get '/students/pre-sorted/:id' do
  @houses = House.all()
  erb(:presorted)
end
