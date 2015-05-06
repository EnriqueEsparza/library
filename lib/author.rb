class Author
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    if attributes.has_key?(:id)
      @id = attributes.fetch(:id)
    end
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
      all_authors.push(Author.new({ :name => name, :id => id }))
    end
    all_authors
  end

  define_singleton_method(:find) do |id|
    sql = "SELECT * FROM author WHERE id = #{id}"
    result = DB.exec(sql).first()
    name = result.fetch('name')
    Author.new({ :name => name, :id => id })
  end

  define_method(:delete) do
    DB.exec("DELETE FROM author WHERE id = #{self.id()};")
  end

end
