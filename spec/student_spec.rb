require './student'

describe Student do

    before (:each) do
        @student = Student.new(17, false, 'Mike') 
    end

    context "testing initialize method of student class" do
        it "should create an object of the student class" do

            expect(@student.name).to eq('Mike')
            expect(@student.parent_permission).to eq(false)
        end
    end

    context "testing make_student method of student class" do
        it "should populate the global students array" do
            student2 = Student.new(17, false, 'Ann')
            student3 = Student.new(19, true, 'James')
            @student.make_student
            student2.make_student
            student3.make_student

            expect(Student.all.length).to eq(3)
            expect(Student.all.empty?).to eq(false)
        end
    end

    context "testing play_hooky method of student class" do
        it "should check if student plays hooky" do

            expect(@student.play_hooky).to eq('¯(ツ)/¯')
        end
    end

    context "testing classroom setter method of student class" do
        it "should set the classroom of student" do
            @student.classroom = 'Math'

            expect(@student.classroom).to eq('Math')
        end
    end
    
end