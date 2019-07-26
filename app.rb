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
  "Page for a specific word based off its ID #{params[:id]}"
end

post('/') do
  new_word = params[:term]
  term = Term::Word.new({:term => new_word})
  term.create
  @terms = Term::Word.all
  erb(:index)
end

get('/words/:id/edit') do
  "Page to edit a word based on ID #{params[:id]}"
end

patch('/words/:id') do
  "Will update words"
end

delete('/words/:id') do
  "Will delete words"
end
