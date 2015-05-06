class Author
  attr_reader(:name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_method(:save) do

  end

  define_singleton_method(:all) do

  end

end
