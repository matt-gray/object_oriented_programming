class Person
  attr_accessor :name

  def greeting
    "Hi my name is #{@name}"
  end
end

class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object"
  end
end

instructor = Instructor.new
instructor.name = "Chris"
puts instructor.greeting

student = Student.new
student.name = "Cristina"
puts student.greeting
