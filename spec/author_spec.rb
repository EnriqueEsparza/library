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
      expect(Author.all().count()).to(eq(2))
    end
  end

  describe('id') do
    it('returns the database assigned ID to the Author') do
      new_author = Author.new({ :name => 'Mike Jones'})
      new_author.save()
      expect(new_author.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it("returns author by id") do
      new_author = Author.new({ :name => 'Mike Jones'})
      new_author.save()
      id = new_author.id()
      expect(Author.find(id).id).to(eq(new_author.id))
    end
  end

  describe('#delete') do
    it('deletes the current author') do
      new_author = Author.new({ :name => "Mike Jones"})
      new_author.save()
      new_author.delete()
      expect(Author.all().length()).to(eq(0))
    end
  end

end
