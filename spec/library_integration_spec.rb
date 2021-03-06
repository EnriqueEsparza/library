require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('Sinatra framework check', { :type => :feature }) do
  it('verifies basic routing and view setup') do
    visit('/test')
    expect(page).to have_content('Sinatra OK')
  end
end

describe('Library integration', { :type => :feature }) do
  it('Adds new patron') do
    visit('/patrons/add')
    fill_in('name', :with => 'Test Dude')
    click_button('Add Patron')
    expect(page).to have_content('Test Dude')
  end

  describe('Books integration', { :type => :feature}) do
    it('Adds new book') do
      #add author
      visit('/authors/add')
      fill_in('name', :with => 'Dude')
      click_button('Add Author')
      #add book
      visit('/books/add')
      fill_in('title', :with => 'Learn to Ruby')
      select("Dude", :from => "author")
      click_button('Add Book')

      expect(page).to have_content('Learn to Ruby')
    end
    it('Adds copies of book to library') do
      #add author
      visit('/authors/add')
      fill_in('name', :with => 'Dude')
      click_button('Add Author')

      visit('/books/add')
      fill_in('copies', :with => '5')
      click_button('Add Book')
      expect(page).to have_content('5')
    end
  end

  it('Adds new Author') do
    visit('/authors/add')
    fill_in('name', :with => 'Bigshot Writer')
    click_button('Add Author')
    expect(page).to have_content('Bigshot Writer')
  end
end







# As a librarian, I want to create, read, update, delete, and list books in the catalog, so that we can keep track of our inventory.

# As a librarian, I want to search for a book by author or title, so that I can find a book easily when the book inventory at the library grows large.

# As a patron, I want to check a book out, so that I can take it home with me.

# As a patron, I want to know how many copies of a book are on the shelf, so that I can see if any are available. (Hint: make a copies table; a book should have many copies.)

# As a patron, I want to see a history of all the books I checked out, so that I can look up the name of that awesome sci-fi novel I read three years ago. (Hint: make a checkouts table that is a join table between patrons and copies.)

# As a patron, I want to know when a book I checked out is due, so that I know when to return it.

# As a librarian, I want to see a list of overdue books, so that I can call up the patron who checked them out and tell them to bring them back - OR ELSE!

# As a librarian, I want to enter multiple authors for a book, so that I can include accurate information in my catalog. (Hint: make an authors table and a books table with a many-to-many relationship.)
