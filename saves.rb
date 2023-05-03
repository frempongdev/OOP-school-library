require './book'
require './student'
require './teacher'
require './rental'

class Saves
    def book_saves
        books = Book.all
        File.open('books.json', 'w') do |file|
          file.write(JSON.dump(books.map { |book| { title: book.title, author: book.author } }))
        end
    end

    def student_saves
    students = Student.all
    File.open('student.json', 'w') do |file|
          file.write(JSON.dump(students.map { |student| { ID: student.id, name: student.name, age: student.age, parent_permission: student.parent_permission } }))
        end
    end

    def teacher_saves
    teachers = Teacher.all
    File.open('teacher.json', 'w') do |file|
          file.write(JSON.dump(teachers.map { |teacher| { ID: teacher.id, name: teacher.name, age: teacher.age, specialization: teacher.specialization } }))
        end
    end
    
    def rental_saves
        rentals = Rental.all


        File.open('rentals.json', 'w') do |file|    
            file.write(JSON.generate(rentals.map { |rental| { date: rental.date, book: JSON.generate(rental.book), person: JSON.generate(rental.person) } }))
        end
    end
end