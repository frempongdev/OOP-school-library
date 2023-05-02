require './book'
require './student'
require './teacher'
require './rental'

class Listings
  def list_all_books
    books = Book.all
    if books.empty?
      puts 'There are no books added yet.'
    else
      puts 'These are all the books:'
      books.each do |book|
        puts "\"#{book.title}\" by #{book.author}"
      end
    end
    puts # blank
  end

  def list_all_people
    students = Student.all
    teachers = Teacher.all

    if students.empty? && teachers.empty?
      puts 'There are no people added yet.'
    else
      puts 'These are all the people:'
      students.each do |student|
        puts "#{student.name}, Student aged #{student.age} with ID: #{student.id}."
      end
      teachers.each do |teacher|
        puts "#{teacher.name}, #{teacher.specialization} Teacher aged #{teacher.age} with ID: #{teacher.id}."
      end
    end
    puts # blank
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