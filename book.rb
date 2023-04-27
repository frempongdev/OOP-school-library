require './rental'
require './person'

class Book
  attr_accessor :rentals, :title, :author
  
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    rentals.push(rental)
  end

end

#Tests
# person = Person.new(22, 'maximilianus')
# b1 = Book.new('Think and Grow Rich', 'Napoleon Hill')
# b2 = Book.new('Atomic Habits', 'James Clear')
# r1 = Rental.new('2020,08,05', b1, person)
# r2 = Rental.new('2023,01,07', b2, person)

# puts "#{r1.person.name} is the First Renter"
# puts "The author of the second rental book is #{r2.book.author}"
# puts "The following are the list of books rented by #{person.name}:", person.rentals.map {|rental| rental.book.title}