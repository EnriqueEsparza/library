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
      expect(new_book.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it("returns book by id") do
      new_book = Book.new({ :title => "Intro to Ruby", :author_id => 1})
      new_book.save()
      id = new_book.id()
      found_book = Book.find(id)
      expect(found_book.id).to(eq(new_book.id))
    end
  end

  describe('.find_by_author') do
    it('returns a list of books by author id') do
      new_book = Book.new({ :title => "Intro to Ruby", :author_id => 1})
      new_book.save()
      new_book2 = Book.new({ :title => "Ruby for Experts", :author_id => 1})
      new_book2.save()
      expect(Book.find_by_author(1).count()).to(eq(2))
    end
  end

  describe('.find_by_title') do
    it('returns book by title') do
      new_book = Book.new({ :title => "Intro to Ruby", :author_id => 1})
      new_book.save()
      expect(Book.find_by_title("Intro to Ruby").title()).to(eq("Intro to Ruby"))
    end
  end

  describe('#delete') do
    it('deletes the current book') do
      new_book = Book.new({ :title => "Intro to Ruby", :author_id => 1})
      new_book.save()
      id = new_book.id()
      expect(Book.all().length()).to(eq(1))
      new_book.delete()
      expect(Book.all().length()).to(eq(0))
    end
  end

  describe('#copies') do
    it('returns the number of copies of a book in the library') do
      new_book = Book.new({ :title => "Intro to Ruby", :author_id => 1, :copies => 10})
      new_book.save()
      expect(new_book.copies()).to(eq(10))
    end
  end

end
