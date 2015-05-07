require('spec_helper')


describe(BookCopies) do
  describe('#id') do
    it('returns the copy id after adding and saving') do
      new_copy = BookCopies.new({ :book_id => 1 })
      new_copy.save()
      expect(new_copy.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it('returns all books with same book_id') do
      new_copy = BookCopies.new({ :book_id => 1})
      new_copy.save()
      expect(BookCopies.find(1).count()).to(eq(1))
    end
  end
end
