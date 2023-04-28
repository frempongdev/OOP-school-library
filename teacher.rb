require './person'

class Teacher < Person
  attr_reader :specialization
  @@teachers = []

  def initialize(specialization, age, name)
    super(age, name)
    @specialization = specialization
    @@teachers << self
  end

  def can_use_service?
    true
  end

  def self.all
    @@teachers
  end
end

# Test
# Bb = Teacher.new('Math', 40)
# puts "Name: #{Bb.name}, ID: #{Bb.id}, Age: #{Bb.age}, Using Service: #{Bb.can_use_service?}"
