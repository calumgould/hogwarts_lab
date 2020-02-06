require_relative("../db/sql_runner")

class Student

  attr_reader :id
  attr_accessor :name, :age, :house

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @age = options['age'].to_i()
    @house = options['house']
  end

  def save()
    sql = "INSERT INTO students (
    name,
    age,
    house
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @age, @house]
    student = SqlRunner.run(sql, values).first()
    @id = student['id']
  end

  def self.find(id)
    sql = "SELECT * FROM students
    WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)
    result = Student.new(student.first)
    return result
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    return students.map{ |student| Student.new(student)}
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end


end
