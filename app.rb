require('sinatra')
require('sinatra/reloader')
require('./lib/book')
require('./lib/author')
require('./lib/patron')
require('./lib/book_copies')
require('./lib/checkout')
also_reload('lib/**/*.rb')
require('pry')
require('pg')

DB = PG.connect({:dbname => 'library_test'})


get('/test') do
  @test_var = 'Sinatra OK'
  erb(:test)
  #redirect to('/')
end

get('/') do
  erb(:index)
end

#add-author form
get('/authors/add') do
  erb(:author_add_form)
end

#add author
post('/authors/add') do
  new_author_name = params.fetch('name')
  author = Author.new({ :name => new_author_name })
  author.save()
  redirect to('/authors')
end

#list authors
get('/authors') do
  @authors = Author.all()
  erb(:authors)
end



#add-patron form
get('/patrons/add') do
  erb(:patron_add_form)
end

#add patron
post('/patrons/add') do
  new_patron_name = params.fetch('name')
  new_patron = Patron.new({ :name => new_patron_name })
  new_patron.save()
  redirect to('/patrons')
end

#list all patrons
get('/patrons') do
  @patrons = Patron.all()
  erb(:patrons)
end

#get a specific patron
get('/patrons/:id') do

end

#add-book form
get('/books/add') do
  @authors = Author.all()
  erb(:books_add_form)
end

#add-book form results
post('/books/add') do
  new_book_title = params.fetch('title')
  new_book_author = params.fetch('author')
  new_book_copies = params.fetch('copies')
  new_book = Book.new({ :title => new_book_title, :author_id => new_book_author, :copies => new_book_copies })
  new_book.save()
  redirect to('/books')
end

#list of added books
get('/books') do
  @books = Book.all()
  erb(:books)
end
