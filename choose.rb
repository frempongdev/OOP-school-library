class Choose
  def choose_person(persons)
    puts 'Please choose the Person for the Rental (input number)'
    persons.each_with_index do |person, index|
      puts "[#{index + 1}] #{person.name}, #{person.class} aged #{person.age} with ID:#{person.id}"
    end
    persons[gets.chomp.to_i - 1]
  end

  def choose_book(books)
    puts 'Please choose the Book for the Rental (input number)'
    books.each_with_index do |book, index|
      puts "[#{index + 1}] \"#{book.title}\" by #{book.author}"
    end
    books[gets.chomp.to_i - 1]
  end
end
