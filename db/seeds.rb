require_relative("../models/student")
require('pry')

Student.delete_all()

student1 = Student.new({
  "name" => "Harry Potter",
  "age" => "11",
  "house" => "Gryffindor"
})
student1.save()

student2 = Student.new({
  "name" => "Ron Weasley",
  "age" => "11",
  "house" => "Gryffindor"
})
student2.save()

student3 = Student.new({
  "name" => "Hermione Granger",
  "age" => "11",
  "house" => "Gryffindor"
})
student3.save()

student4 = Student.new({
  "name" => "Draco Malfoy",
  "age" => "11",
  "house" => "Slytherin"
})
student4.save()

student5 = Student.new({
  "name" => "Cedric Diggory",
  "age" => "12",
  "house" => "Hufflepuff"
})
student5.save()

binding.pry
nil
