class Person
	attr_accessor :name
	def initialize(name)
		@name = name
		@greeting = greeting
	end
end

class Student < Person
	def learn
		"I get it!"
	end

	def greeting
		"Hi, I'm #{name}."
	end
end

class Instructor < Person
	def teach
		"Everything in Ruby is an Object."
	end

	def greeting
		"Hi, I'm your instructor #{name}."
	end
end

instructor = Instructor.new("Chris")
puts instructor.greeting
puts instructor.teach

student = Student.new("Cristina")
puts student.greeting
puts student.learn

#If I put "puts student.teach" it would not work because I have not defined the method teach under the student class.
#It's the same problem with "puts teacher.learn"