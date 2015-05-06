require('spec_helper')

describe(Author) do
  describe('#name') do
    it('returns name of the Author object') do
      new_author = Author.new({ :name => 'Mike Jones' })
      expect(new_author.name()).to(eq('Mike Jones'))
    end
  end

  describe('.all') do
    it('returns all authors') do
      new_author = Author.new({ :name => 'Mike Jones'})
      new_author.save()
      new_author2 = Author.new({ :name => 'Bill Jones'})
      new_author2.save()
      expect(Author.all().length).to(eq(2))
    end
  end

end
