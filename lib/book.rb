class Book
  attr_reader(:title, :author_id, :id, :copies)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @author_id = attributes.fetch(:author_id)
    if attributes.has_key?(:id)
      @id = attributes.fetch(:id)
    end
    if attributes.has_key?(:copies)
      @copies = attributes.fetch(:copies)
    else
      @copies = 1
    end
  end

  define_method(:save) do
    sql = "INSERT INTO books (title, author_id) VALUES ('#{@title}', #{@author_id}) RETURNING id;"
    result = DB.exec(sql)
    @id = result.first().fetch("id").to_i()

    @copies.times do
      sql_copies = "INSERT INTO book_copies (book_id) VALUES (#{@id})"
      DB.exec(sql_copies)
    end
  end

  define_singleton_method(:all) do
    books = []
    sql = "SELECT * FROM books"
    results = DB.exec(sql)
    results.each do |result|
      title = result.fetch('title')
      author_id = result.fetch('author_id')
      books.push(Book.new({ :title => title, :author_id => author_id}))
    end
    books
  end

  define_singleton_method(:find) do |id|
    sql = "SELECT * FROM books WHERE id = #{id}"
    result = DB.exec(sql).first()
    title = result.fetch('title')
    author_id = result.fetch('author_id')
    Book.new({ :title => title, :author_id => author_id, :id => id})
  end

  define_singleton_method(:find_by_author) do |id|
    books = []
    sql = "SELECT * FROM books WHERE author_id = #{id}"
    results = DB.exec(sql)
    results.each do |result|
      title = result.fetch('title')
      author_id = result.fetch('author_id')
      books.push(Book.new({ :title => title, :author_id => author_id}))
    end
    books
  end

  define_singleton_method(:find_by_title) do |title|
    sql = "SELECT * FROM books WHERE title LIKE '#{title}'"
    result = DB.exec(sql).first()
    title = result.fetch('title')
    author_id = result.fetch('author_id')
    Book.new({ :title => title, :author_id => author_id})
  end

  define_method(:delete) do
    DB.exec("DELETE FROM books WHERE id = #{self.id()};")
  end

end
