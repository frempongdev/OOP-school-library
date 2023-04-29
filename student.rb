require './person'

class Student < Person
  attr_accessor :classroom, :parent_permission

  @students = []

  def initialize(age, parent_permission, name = 'Unknown')
    super(age, name, parent_permission: parent_permission)
  end

  def make_student
    self.class.all << self
  end

  def self.all
    @students
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classrooms=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
