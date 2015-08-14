require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/word")
require("./lib/definition")

get("/") do
  erb(:index)
end

get('/words') do
  @words = Word.all()
  erb(:words)
end

get('/words/new') do
  erb(:words_form)
end

post("/words") do
  word = params.fetch("word")
  Word.new(word).save()
  @words = Word.all()
  erb(:success)
end
