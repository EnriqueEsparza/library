class Author
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_method(:save) do
    sql = "INSERT INTO author (name) VALUES ('#{@name}') RETURNING id;"
    result = DB.exec(sql)
    @id = result.first().fetch("id").to_i()
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

  define_singleton_method(:find) do

  end

end
