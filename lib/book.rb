class Book
  attr_reader(:title, :author_id)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @author_id = attributes.fetch(:author_id)
  end

  define_method(:save) do
    sql = "INSERT INTO book (title, author_id)
    VALUES ('#{@title}', #{@author_id})"
    DB.exec(sql)
  end

  define_singleton_method(:all) do
    books = []
    sql = "SELECT * FROM book"
    results = DB.exec(sql)
    results.each do |result|
      title = result.fetch('title')
      author_id = result.fetch('author_id')
      books.push(Book.new({ :title => title, :author_id => author_id}))
    end
    books
  end

end
