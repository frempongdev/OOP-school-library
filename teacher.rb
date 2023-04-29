require './person'

class Teacher < Person
  attr_reader :specialization

  @teachers = []

  def initialize(specialization, age, name)
    super(age, name)
    @specialization = specialization
    self.class.all << self
  end

  def can_use_service?
    true
  end

  def self.all
    @teachers
  end
end
