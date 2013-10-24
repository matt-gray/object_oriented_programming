class Person
  attr_accessor :name

  def greeting
    "Hi my name is #{@name}"
  end
end

class Student
  def learn
    puts "I get it!"
end

class Instructor
  def teach
    puts "Everything in Ruby is an Object"
end