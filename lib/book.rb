class Book
  attr_reader(:title, :author_id, :id)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @author_id = attributes.fetch(:author_id)
    if attributes.has_key?(:id)
      @id = attributes.fetch(:id)
    end
  end

  define_method(:save) do
    sql = "INSERT INTO book (title, author_id)
    VALUES ('#{@title}', #{@author_id}) RETURNING id;"
    result = DB.exec(sql)
    @id = result.first().fetch("id").to_i()
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

  define_singleton_method(:find) do |id|
    sql = "SELECT * FROM book WHERE id = #{id}"
    result = DB.exec(sql).first()
    title = result.fetch('title')
    author_id = result.fetch('author_id')
    Book.new({ :title => title, :author_id => author_id, :id => id})
  end

end
