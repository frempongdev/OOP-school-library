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
          file.write(JSON.dump(rentals.map { |rental| { date: rental.date, book: {title:rental.book.title, author: rental.book.author}, person: {id: rental.person.id, age: rental.person.age, name: rental.person.name} } }))
        end
    end
end