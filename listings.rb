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
end