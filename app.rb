require './book'
require './student'
require './teacher'
require './rental'
require './creation'

class App
  @@creation = Creation.new

  def start
    puts 'Welcome to your School Library App!'
    puts # blank
    @menu_choice = ''
    menu until @menu_choice.upcase == 'X'
  end

  def menu
    sleep(1.5)
    puts 'Please choose an option by entering a number or [X] to exit'
    puts '[1] List all Books', '[2] List all People', '[3] Create a Person', '[4] Create a Book',
         '[5] Create Rental', '[6] List all Rentals by a given ID', '[X] Exit'
    puts # blank
    print 'OPTION CHOSEN: '
    @menu_choice = gets.chomp
    if @menu_choice.upcase == 'X'
      puts 'Goodbye!'
    elsif @menu_choice.to_i != 0 && @menu_choice.to_i.between?(1, 6)
      sleep(1)
      enter_menu
    else
      puts 'Please choose a valid option!'
      puts # blank
    end
  end

  def enter_menu
    case @menu_choice
    when '1' then list_all_books
    when '2' then list_all_people
    when '3' then @@creation.create_person
    when '4' then @@creation.create_book
    when '5' then @@creation.create_rental
    when '6' then list_rental_by_id
    end
  end

  def choose_person(persons)
    puts 'Please choose the Person for the Rental (input number)'
    persons.each_with_index do |person, index|
      puts "[#{index + 1}] #{person.name}, #{person.class} aged #{person.age} with ID:#{person.id}"
    end
    persons[gets.chomp.to_i - 1]
  end

  def choose_book(books)
    puts 'Please choose the Book for the Rental (input number)'
    books.each_with_index do |book, index|
      puts "[#{index + 1}] \"#{book.title}\" by #{book.author}"
    end
    books[gets.chomp.to_i - 1]
  end

  def create_rental
    students = Student.all
    teachers = Teacher.all
    persons = students + teachers
    books = Book.all
    if persons.empty?
      puts 'There are no People added yet.'
    else
      @r_person = choose_person(persons)
    end
    if books.empty?
      puts 'There are no Books added yet.'
    else
      @r_book = choose_book(books)
    end
    return if books.empty? && persons.empty?

    print 'Please input Date of Rental (YYYY/MM/DD): '
    r_date = gets.chomp
    Rental.new(r_date, @r_book, @r_person)
    puts 'Rental created successfully!'
  end

  def list_rental_by_id
    rentals = Rental.all
    puts 'Please provide Person ID for Rental list...'
    p_id = gets.chomp.to_i
    rental_found = false
    puts # blank
    puts "All Rentals by User ID:#{p_id}"
    rentals.each do |rental|
      next unless rental.person.id == p_id

      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      rental_found = true
    end
    puts "No Rental for Person with ID: #{p_id}" unless rental_found
    puts # blank
  end
end
