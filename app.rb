require './creation'
require './listings'
require './saves'
require './converter'
require 'json'

class App
  def initialize
    @creation = Creation.new
    @listings = Listings.new
  end

  def load_book
    return if File.empty?('books.json') || !File.exist?('books.json')

    JSON.parse(File.read('books.json')).map do |book_data|
      Book.new(book_data['title'], book_data['author'])
    end
  end

  def load_people
    if File.empty?('student.json') || !File.exist?('student.json')
      puts 'No student available'
    else
      JSON.parse(File.read('student.json')).map do |student_data|
        student = Student.new(student_data['age'], student_data['parent_permission'], student_data['name'])
        student.make_student
      end
    end
    return if File.empty?('teacher.json') || !File.exist?('teacher.json')

    JSON.parse(File.read('teacher.json')).map do |teacher_data|
      Teacher.new(teacher_data['specialization'], teacher_data['age'], teacher_data['name'])
    end
  end

  def load_rental
    return if File.empty?('rentals.json')

    JSON.parse(File.read('rentals.json')).map do |rental_data|
      book = BookConverter.new(rental_data['book']['title'], rental_data['book']['author'])
      person = PersonConverter.new(rental_data['person']['id'], rental_data['person']['age'],
                                   rental_data['person']['name'])
      Rental.new(rental_data['date'], book, person)
    end
  end

  def loading
    load_book
    load_people
    load_rental
  end

  def start
    loading
    puts 'Welcome to your School Library App!'
    puts # blank
    @menu_choice = ''
    menu until @menu_choice.upcase == 'X'
  end

  def show_menu_options
    sleep(1.5)
    puts 'Please choose an option by entering a number or [X] to exit'
    puts '[1] List all Books', '[2] List all People', '[3] Create a Person', '[4] Create a Book',
         '[5] Create Rental', '[6] List all Rentals by a given ID', '[X] Exit'
    puts # blank
    print 'OPTION CHOSEN: '
  end

  def menu
    show_menu_options
    @menu_choice = gets.chomp
    if @menu_choice.upcase == 'X'
      saves = Saves.new
      saves.book_saves
      saves.student_saves
      saves.teacher_saves
      saves.rental_saves
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
    when '1' then @listings.list_all_books
    when '2' then @listings.list_all_people
    when '3' then @creation.create_person
    when '4' then @creation.create_book
    when '5' then @creation.create_rental
    when '6' then @listings.list_rental_by_id
    end
  end
end
