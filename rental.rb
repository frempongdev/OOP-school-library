class Rental
  attr_accessor :date, :book, :person

  @rentals = []

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)

    @person = person
    person.rentals.push(self) unless person.rentals.include?(self)

    self.class.all << self
  end

  def self.all
    @rentals
  end
end
