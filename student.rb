require './person'

class Student < Person
  def initialize(classroom)
    super('Big Mike', 45)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

#Tests
# Bb = Student.new('science')
# puts Bb.name, Bb.id, Bb.age
# puts Bb.play_hooky
