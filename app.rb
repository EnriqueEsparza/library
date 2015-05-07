require('sinatra')
require('sinatra/reloader')
require('./lib/book')
also_reload('lib/**/*.rb')
require('pry')


get('/test') do
  @test_var = 'Sinatra OK'
  erb(:test)
  #redirect to('/')
end

get('/') do
  erb(:index)
end

#add a patron
get('/patrons/add')

end

#list all patrons
get('/patrons')

end

#get a specific patron
get('/patrons/:id')

end
