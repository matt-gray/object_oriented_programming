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

#part 6
instructor = Instructor.new
instructor.name = "Chris"
puts instructor.greeting

#part 7
student = Student.new
student.name = "Cristina"
puts student.greeting

#part 8
instructor.teach
student.learn

instructor.learn
student.teach
#produces erro => e

=begin
  people.rb:35:in `<main>': undefined method `learn' for 
  #<Instructor:0x007fda438244f0 @name="Chris"> (NoMethodError)
  This produces an error because the learn method does not exist
  within the instructor class. 
=end






