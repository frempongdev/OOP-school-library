require './book'
require './person'

describe Book do
  context 'add rental method' do
    it 'should add a new rental' do
      book = Book.new('Things fall apart', 'Chinua Achebe')
      rental = book.add_rental(Person.new(21, 'Frempong'), '2023')

      expect(rental.book).to eq(book)
      expect(rental.person.age).to eq(21)
    end
  end

  context 'initialize method' do
    it 'should create a book instance' do
      book = Book.new('Things fall apart', 'Chinua Achebe')

      expect(book.title).to eq('Things fall apart')
      expect(book.author).to eq('Chinua Achebe')
    end
  end
end
