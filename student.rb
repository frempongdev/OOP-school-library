require './person'

class Student < Person
  attr_accessor :classroom
  @@students = []

  def make_students
    @@students << self 
  end

  def self.all 
    @@students
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classrooms=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
