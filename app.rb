require './creation'
require './listings'
require './saves'
require 'json'

class App
  def initialize
    @creation = Creation.new
    @listings = Listings.new
  end

  def loading
    if File.zero?('books.json')
    else
      book_reads = JSON.load(File.read('books.json')).map do |book_data|
      Book.new(book_data['title'], book_data['author'])
      end
    end
    if File.zero?('student.json')
    else
        student_reads = JSON.load(File.read('student.json')).map do |student_data|
        Student.new(student_data['age'], student_data['parent_permission'], student_data['name'])
        end
    end
    if File.zero?('teacher.json')
    else
      teacher_reads = JSON.load(File.read('teacher.json')).map do |teacher_data|
      Teacher.new(teacher_data['specialization'], teacher_data['age'], teacher_data['name'])
      end
    end
    if File.zero?('rentals.json')
    else
    rental_reads = JSON.load(File.read('rentals.json')).map do |rental_data|
      Rental.new(rental_data['date'], JSON.load(rental_data['book']), JSON.load(rental_data['person']))
      end  
    end
  end

  def start
    loading
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
