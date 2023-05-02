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

  
end