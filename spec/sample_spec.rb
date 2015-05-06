require('spec_helper')

describe(Book) do
  describe('.all') do
    it('returns all created books') do
      new_book = Book.new({ :title => 'Intro to Ruby', :author_id => 1 })
      new_book.save()
      expect(Book.all().length).to(eq(1))
    end
  end
end
