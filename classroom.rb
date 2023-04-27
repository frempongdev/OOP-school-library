require './student'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    students.push(student)
    student.classroom = self
  end
end

# Tests
# sc = Classroom.new('Science')
# bb = Student.new(17, 'Obour')
# tt = Student.new(21, 'Theo')
# sc.add_student(bb)
# sc.add_student(tt)
# puts "#{tt.name} belongs to the #{tt.classroom.label} class"
# puts "The #{sc.label} class has these students...", sc.students.map(&:name)