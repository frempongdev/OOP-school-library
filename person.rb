require './nameable'
require './decorator'
require './rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_service?
    of_age? == true || @parent_permission == true
  end

  def correct_name
    name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def self.all; end

  private

  def of_age?
    @age >= 18
  end
end
