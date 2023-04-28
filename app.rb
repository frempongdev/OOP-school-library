require './book'

class App
    def start
        puts 'Welcome to your School Library App!'
        puts #blank space
        @menu_choice = ''
        until @menu_choice.upcase == 'X'
            menu()
        end
             
    end

    def menu
        sleep(1.5)
        puts 'Please choose an option by entering a number or [X] to exit'
        puts '[1] List all Books', '[2] List all People', '[3] Create a Person', '[4] Create a Book', '[5] Create Rental', '[6] List all Rentals by a given ID', '[X] Exit'
        puts #blank
        print 'Type number here: '
        @menu_choice = gets.chomp
        if @menu_choice.upcase == 'X'
            puts 'Goodbye!'
        elsif @menu_choice.to_i != 0 && @menu_choice.to_i.between?(1,6) 
            puts "Option #{@menu_choice} chosen..."
            sleep(1.5)
            enter_menu()
        else   
            puts 'Please choose a valid option!'
            puts #blank
        end
    end
    
    def enter_menu
        case @menu_choice
          when '1'
            list_all_books()
            puts #blank
          end
    end

    def list_all_books
        books = Book.all
        if books.empty?
            puts 'There are no books added yet.'
            puts #blank
        else
            puts 'These are all the books:'
            p books
            books.each do |book|
                puts "#{book.title} by #{book.author}"
            end
            puts #blank
        end
    end

end