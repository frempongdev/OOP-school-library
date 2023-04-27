class App
    def start
        puts 'Welcome to your School Library App!'
        puts #blank space
        sleep(1.5)
        menu()
    end

    def menu
        puts 'Please choose an option by entering a number'
        puts '[1] List all Books', '[2] List all People', '[3] Create a Person', '[4] Create a Book', '[5] Create Rental', '[6] List all Rentals by a given ID', '[X] Exit'
        puts #blank space
        print 'Type number here: '
        @menu_choice = gets.chomp
        puts @menu_choice
    end
end