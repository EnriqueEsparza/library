require('spec_helper')

describe(Book) do
  describe('#title') do
    it('returns title of book object') do
      new_book = Book.new({ :title => 'Intro to Ruby', :author_id => 1 })
      expect(new_book.title()).to(eq('Intro to Ruby'))
      expect(new_book.author_id()).to(eq(1))
    end
  end

  describe('.all') do
    it('returns all books in library') do
    new_book = Book.new({ :title => "Intro to Ruby", :author_id => 1})
    new_book.save()
    expect(Book.all().length()).to(eq(1))
    end
  end

  describe('#id') do
    it('returns the database-assigned id of the book') do
      new_book = Book.new({ :title => "Intro to Ruby", :author_id => 1})
      new_book.save()
      expect(new_book.id()).to(eq(Fixnum))
    end
  end

end
