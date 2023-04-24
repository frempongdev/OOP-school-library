class Person
    attr_accessor :name, :age
    attr_reader :id
  
    public
  
    def initialize(name = 'Unknown', parent_permission = true, age)
      @id = Random.rand(1...1000)
      @name = name
      @age = age
      @parent_permission = parent_permission
    end
  
    def can_use_service?
      if of_age? == true || @parent_permission == true
        true
      else
        false
      end
    end
  
    private
  
    def of_age?
      if @age >= 18
        true
      else
        false
      end
    end
  end
  
  Bb = Person.new('Big Mike', 45)
  puts Bb.name, Bb.id, Bb.age
