require './person'
# require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name)
    super(age, name)
  end
  
  def play_hooky
    '¯(ツ)/¯'
  end
  
  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

# Tests
# Bb = Student.new(17, 'Obour')
# Bb.classroom = 'Science'
# puts "Name: #{Bb.name}, ID: #{Bb.id}, Age: #{Bb.age}"
# puts "Plays #{Bb.play_hooky}"
# puts "Belongs to the #{Bb.classroom} class"
