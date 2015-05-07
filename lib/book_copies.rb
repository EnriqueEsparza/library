class BookCopies
  attr_reader(:id)

  define_method(:initialize) do |attributes|
    @book_id = attributes.fetch(:book_id)
    if attributes.has_key?(:id)
      @id = attributes.fetch(:id)
    end
  end

  define_method(:save) do
    sql = "INSERT INTO book_copies (book_id) VALUES (#{@book_id}) RETURNING id;"
    result = DB.exec(sql)
    @id = result.first().fetch("id").to_i()

  end

  define_singleton_method(:find) do |book_id|
    books_by_author =  []
    sql = "SELECT * FROM book_copies WHERE book_id = #{book_id}"
    results = DB.exec(sql)
    results.each do |result|
      id = result.fetch("id")
      books_by_author.push(BookCopies.new({ :book_id => book_id, :id => id }))
    end
    books_by_author
  end

end
