require ('./lib/word')
require ('sinatra')
require ('sinatra/reloader')
require ('pry')
also_reload ('lib/**/*.rb')

get ('/') do
  @terms = Term::Word.all
  erb(:index)
  # "Home page with a list of words (aka Terms)"
end

get('/terms') do
  "Page with a list of words - should this just be home?"
end

get('/terms/new') do
  erb(:word_new)
end

get('/terms/:id') do
  @term = Term::Word.find(params[:id].to_i())
  erb(:word)
end

post('/') do
  new_word = params[:term]
  term = Term::Word.new({:term => new_word})
  term.create
  binding.pry
  @terms = Term::Word.all
  erb(:index)
end

get('/terms/:id/edit') do
  @term = Term::Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/terms/:id') do
  @term = Term::Word.find(params[:id].to_i())
  @term.edit(params[:term])
  erb(:word)
end

delete('/words/:id') do
  "Will delete words"
end
