require_relative '../person'
require_relative '../book'

describe Person do
  context 'testing initialize method of person class' do
    it 'should create an object of the person class' do
      person = Person.new(33)

      expect(person.age).to eq(33)
      expect(person.name).to eq('Unknown')
      expect(person.correct_name).to eq('Unknown')
      expect(person.correct_name).to eq('Unknown')
    end
  end

  context 'testing correct name method of person class' do
    it 'should return the correct name' do
      person = Person.new(33)

      expect(person.correct_name).to eq('Unknown')
    end
  end
  context 'testing can_use_services method of person class' do
    it 'should return true if person can use services' do
      person = Person.new(33)

      expect(person.can_use_service?).to eq(true)
    end
  end

  context 'add rental method' do
    it 'should add a new rental' do
      book = Book.new('Things fall apart', 'Chinua Achebe')
      person = Person.new(33)
      rental = person.add_rental(book, '2023')

      expect(rental.book).to eq(book)
      expect(rental.person.age).to eq(33)
    end
  end
end
