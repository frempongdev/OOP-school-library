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
