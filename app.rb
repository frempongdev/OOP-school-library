require './book'
require './student'
require './teacher'

class App
    def start
        puts 'Welcome to your School Library App!'
        puts #blank
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
            puts #blank
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
          when '2'
            list_all_people()
          when '3'
            create_person()
    end

    def list_all_books
        books = Book.all
        if books.empty?
            puts 'There are no books added yet.'
        else
            puts 'These are all the books:'
            books.each do |book|
                puts "#{book.title} by #{book.author}"
            end
        end
        puts #blank
    end

    def list_all_people
        students = Student.all
        teachers = Teacher.all

        if students.empty? && teachers.empty?
            puts 'There are no people added yet.'
        else
            puts 'These are all the people:'
            students.each do |student|
                puts "#{student.name} is a Student aged #{student.age}"
            end
            teachers.each do |teacher|
                puts "#{teacher.name} is a Teacher aged #{teacher.age} and specializes in #{teacher.specialization}"
            end
        end
        puts #blank
    end

    def create_person
        puts 'Do you want to create a Student [1] or a Teacher [2] ? (input number)'
        input = gets.chomp
        case input
        when '1'
            puts 'Please add details of Student...'
            print 'Name: '
            s_name = gets.chomp
            print 'Age: '
            s_age = gets.chomp.to_i
            Student.new(s_age, s_name).make_student
            puts 'Student created successfully!'
        when '2'
            puts 'Please add details of Teacher...'
            print 'Name: '
            t_name = gets.chomp
            print 'Age: '
            t_age = gets.chomp.to_i
            print 'Specialization: '
            t_spec = gets.chomp
            Teacher.new(t_spec, t_age, t_name)
            puts 'Teacher created successfully!'
        end
    end

end