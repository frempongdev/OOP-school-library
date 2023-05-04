require './rental'
require './book'
require './student'


describe Rental do
    before (:each) do 
        @student = Student.new(17, false, 'Ann')
        @book = Book.new('Things fall apart','Chinua Achebe')
        @rental = Rental.new('2020', @book, @student)
    end

    context "test initialize method of Rental class" do
        it "create a new object of the Rental class" do
            expect(@rental.book).to eq(@book)
            expect(@rental.person.name).to eq('Ann')
            expect(@rental.person.id).to eq(@student.id)
            expect(@book.rentals.empty?).to eq(false)
        end

    end

end
