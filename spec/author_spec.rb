require('spec_helper')

describe(Author) do
  describe('#name') do
    it('returns name of the Author object') do
      new_author = Author.new({ :name => 'Mike Jones' })
      expect(new_author.name()).to(eq('Mike Jones'))
    end
  end
  
end
