require './nameable'
require './decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

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

  def add_rental(rental)
    rentals.push(rental)
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end

# Tests
# person = Person.new(22, 'maximilianus')
# puts person.correct_name
# capitalizedPerson = CapitalizeDecorator.new(person)
# puts capitalizedPerson.correct_name
# capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
# puts capitalizedTrimmedPerson.correct_name
