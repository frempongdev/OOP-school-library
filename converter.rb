class BookConverter
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end

class PersonConverter
  attr_accessor :id, :age, :name, :rentals

  def initialize(id, age, name)
    @id = id
    @age = age
    @name = name
    @rentals = []
  end
end
