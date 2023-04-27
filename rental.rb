class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)

    @person = person
    person.rentals.push(self) unless person.rentals.include?(self)
  end
end
