class BookCopies
  attr_reader(:id)

  define_method(:initialize) do |attributes|
    @book_id = attributes.fetch(:book_id)
  end

  define_method(:save) do
    sql = "INSERT INTO book_copies (book_id) VALUES (#{@book_id}) RETURNING id;"
    result = DB.exec(sql)
    @id = result.first().fetch("id").to_i()

  end

  define_singleton_method(:find) do |book_id|
    []
  end

end
