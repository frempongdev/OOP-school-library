require './nameable.rb'
require './decorator.rb'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_service?
    of_age? == true || @parent_permission == true
  end
  
  def correct_name
    name
  end
  private

  def of_age?
    @age >= 18
  end

end

# Tests
# Bb = Person.new('Big Mike', 45)
# puts Bb.name, Bb.id, Bb.age

person = Person.new(22, 'maximilianus')
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  capitalizedTrimmedPerson.correct_name