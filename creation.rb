require './student'
require './teacher'
require './book'
require './rental'

class Creation
    def create_person
    puts 'Do you want to create a Student [1] or a Teacher [2]? (input number)'
    input = gets.chomp

    case input
    when '1' then create_student
                  puts 'Student created successfully!'
    when '2' then create_teacher
                  puts 'Teacher created successfully!'
    end
  end

  def create_student
    puts 'Please add details of Student...'
    print 'Name: '
    s_name = gets.chomp
    print 'Age: '
    s_age = gets.chomp.to_i
    print 'Has parent permission (Y/N): '
    s_perm = gets.chomp.upcase == 'Y'
    Student.new(s_age, s_perm, s_name).make_student
  end

  def create_teacher
    puts 'Please add details of Teacher...'
    print 'Name: '
    t_name = gets.chomp
    print 'Age: '
    t_age = gets.chomp.to_i
    print 'Specialization: '
    t_spec = gets.chomp
    Teacher.new(t_spec, t_age, t_name)
  end

  def create_book
    print 'Please add Book title: '
    b_title = gets.chomp
    print 'Please add Book author: '
    b_author = gets.chomp
    Book.new(b_title, b_author)
    puts 'Book added successfully!'
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
end
