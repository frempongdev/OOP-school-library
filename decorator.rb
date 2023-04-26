require './nameable.rb'

class Decorator < Nameable
  def initialize(nameable)
    @nameable = Nameable.new()
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    super.slice(0,10)
  end
end