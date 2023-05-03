require './book'
require './student'
require './teacher'
require './rental'

class Saves
  def book_saves
    books = Book.all
    File.write('books.json', JSON.dump(books.map { |book| { title: book.title, author: book.author } }))
  end

  def student_saves
    students = Student.all
    File.write('student.json', JSON.dump(students.map do |student|
                                           { ID: student.id, name: student.name, age: student.age,
                                             parent_permission: student.parent_permission }
                                         end))
  end

  def teacher_saves
    teachers = Teacher.all
    File.write('teacher.json', JSON.dump(teachers.map do |teacher|
                                           { ID: teacher.id, name: teacher.name, age: teacher.age,
                                             specialization: teacher.specialization }
                                         end))
  end

  def rental_saves
    rentals = Rental.all
    File.write('rentals.json', JSON.dump(rentals.map do |rental|
      { date: rental.date, book: { title: rental.book.title, author: rental.book.author },
        person: { id: rental.person.id, age: rental.person.age, name: rental.person.name } }
    end))
  end
end
