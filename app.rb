require './creation'
require './listings'

class App
  def initialize
    @creation = Creation.new
    @listings = Listings.new
  end

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
    when '1' then @listings.list_all_books
    when '2' then @listings.list_all_people
    when '3' then @creation.create_person
    when '4' then @creation.create_book
    when '5' then @creation.create_rental
    when '6' then @listings.list_rental_by_id
    end
  end
end
