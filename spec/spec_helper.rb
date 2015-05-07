require('rspec')
require('pg')
require('pry')
require('book')
require('author')
require('patron')

DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.before(:each) do
    #optionally do something before each test
  end
  config.after(:each) do
    DB.exec('DELETE FROM books *;')
    DB.exec('DELETE FROM book_copies *;')
    DB.exec('DELETE FROM checkedout *;')
    DB.exec('DELETE FROM patrons *;')
    DB.exec('DELETE FROM authors *;')
  end
end
