require './classroom'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Math')
  end

  context 'test initialize method for Classroom class' do
    it 'should create a new object of the Classroom class' do
      expect(@classroom.label).to eq('Math')
    end
  end

  context 'test add_student method for Classroom class' do
    it 'should add new student to the student array of the classroom class' do
      student = Student.new(19, true, 'James')
      @classroom.add_student(student)

      expect(@classroom.students.empty?).to eq(false)
      expect(student.classroom).to eq(@classroom)
    end
  end
end
