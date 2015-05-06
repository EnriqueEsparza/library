require('spec_helper')

describe(Patron) do
  describe('#name') do
    it('returns name of the Patron object') do
      new_patron = Patron.new({ :name => 'Mike Smith' })
      expect(new_patron.name()).to(eq('Mike Smith'))
    end
  end

  describe('.all') do
    it('returns all patrons') do
      new_patron = Patron.new({ :name => 'Mike Smith'})
      new_patron.save()
      new_patron2 = Patron.new({ :name => 'Bill Smith'})
      new_patron2.save()
      expect(Patron.all().count()).to(eq(2))
    end
  end

  describe('id') do
    it('returns the database assigned ID to the Patron') do
      new_patron = Patron.new({ :name => 'Mike Smith'})
      new_patron.save()
      expect(new_patron.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it("returns patron by id") do
      new_patron = Patron.new({ :name => 'Mike Smith'})
      new_patron.save()
      id = new_patron.id()
      expect(Patron.find(id).id).to(eq(new_patron.id))
    end
  end

  describe('#delete') do
    it('deletes the current patron') do
      new_patron = Patron.new({ :name => "Mike Smith"})
      new_patron.save()
      new_patron.delete()
      expect(Patron.all().length()).to(eq(0))
    end
  end

end
