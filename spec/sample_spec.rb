require('spec_helper')

describe(Book) do
  describe('#title') do
    it('returns title of book object') do
      new_book = Book.new({ :title => 'Intro to Ruby', :author_id => 1 })
      expect(new_book.title()).to(eq('Intro to Ruby'))
      expect(new_book.author_id()).to(eq(1))
    end
  end
end
