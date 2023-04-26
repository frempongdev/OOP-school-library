require './nameable.rb'

class Decorator < Nameable
  def initialize(nameable)
    @nameable = Nameable.new()
  end

  def correct_name
    @nameable.correct_name
  end
end
