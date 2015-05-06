class Author
  attr_reader(:name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_method(:save) do
    sql = "INSERT INTO author (name) VALUES ('#{@name}')"
    DB.exec(sql)
  end

  define_singleton_method(:all) do
    all_authors = []
    sql = "SELECT * FROM author"
    results = DB.exec(sql)
    results.each do |result|
      name = result.fetch("name")
      id = result.fetch('id')
      all_authors.push(Author.new({ :name => name }))
    end
    all_authors
  end

end
