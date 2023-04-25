require './person'

class Teacher < Person
  def initialize(specialization, age)
    super(age)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end

# Test
# Bb = Teacher.new('Math', 40)
# puts "Name: #{Bb.name}, ID: #{Bb.id}, Age: #{Bb.age}, Using Service: #{Bb.can_use_service?}"
