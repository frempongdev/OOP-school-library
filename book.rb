require './rental'
require './person'

class Book
  attr_accessor :title, :author

  @books = []

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    self.class.all << self
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def rentals
    @rentals
  end

  def self.all
    @books
  end
end
