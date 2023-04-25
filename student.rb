require './person'

class Student < Person
  def initialize(name, classroom, age)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

# Tests
# Bb = Student.new(17, 'science', 'Obour')
# puts "Name: #{Bb.name}, ID: #{Bb.id}, Age: #{Bb.age}"
# puts "Plays #{Bb.play_hooky}"
