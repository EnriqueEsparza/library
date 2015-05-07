require('spec_helper')
describe(Checkout) do
  describe('.find_by_patron_id') do
    it('returns a list of checkouts by patron id') do
      checkout1 = Checkout.new({ :patron_id => 3, :on_date => '2015-05-12', :book_copy_id => 4})
      checkout1.save()
      checkout1 = Checkout.new({ :patron_id => 3, :on_date => '2015-07-11', :book_copy_id => 9})
      checkout1.save()
      expect(Checkout.find_by_patron_id(3).count()).to(eq(2))
    end
  end
end
