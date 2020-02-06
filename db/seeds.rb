require_relative("../models/student")
require_relative("../models/house")
require('pry')

Student.delete_all()
House.delete_all()

house1 = House.new({
  "name" => "Gryffindor"
  })

house2 = House.new({
  "name" => "Hufflepuff"
  })

house3 = House.new({
  "name" => "Slytherin"
  })

house4 = House.new({
  "name" => "Ravenclaw"
  })

house1.save()
house2.save()
house3.save()
house4.save()


student1 = Student.new({
  "name" => "Harry Potter",
  "age" => "11",
  "house_id" => house1.id
})
student1.save()

student2 = Student.new({
  "name" => "Ron Weasley",
  "age" => "11",
  "house_id" => house1.id
})
student2.save()

student3 = Student.new({
  "name" => "Hermione Granger",
  "age" => "11",
  "house_id" => house1.id
})
student3.save()

student4 = Student.new({
  "name" => "Draco Malfoy",
  "age" => "11",
  "house_id" => house2.id
})
student4.save()

student5 = Student.new({
  "name" => "Cedric Diggory",
  "age" => "12",
  "house_id" => house3.id
})
student5.save()


binding.pry
nil
