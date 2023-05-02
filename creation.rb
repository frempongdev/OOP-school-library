require './student'
require './teacher'
require './book'

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
end
