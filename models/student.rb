require_relative("../db/sql_runner")

class Student

  attr_reader :id
  attr_accessor :name, :age, :house_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @age = options['age'].to_i()
    @house_id = options['house_id'].to_i()
  end

  def save()
    sql = "INSERT INTO students (
    name,
    age,
    house_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @age, @house_id]
    student = SqlRunner.run(sql, values).first()
    @id = student['id']
  end

  def house_name()
    sql = "SELECT houses.name FROM houses WHERE id = $1"
    values = [@house_id]
    house_name = SqlRunner.run(sql, values).first
    return house_name["name"]
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
