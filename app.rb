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

get('/words') do
  "Page with a list of words - should this just be home?"
end

get('/words/new') do
  "Page to add new words"
end

get('/words/:id') do
  "Page for a specific word based off its ID #{params[:id]}"
end

post('/words') do
  "Add words to our word list"
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
