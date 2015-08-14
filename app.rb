#########################################
#############__Needed-Gems__#############
#########################################

require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/word")
require("./lib/definition")


#########################################
#############__WORD-Class__##############
#########################################

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

get("/words/:id") do
  @word = Word.find(params.fetch("id").to_i())
  erb(:word)
end


#########################################
#############__DEFINITION-Class__########
#########################################

get("/words/:id/definitions/new") do
  @word = Word.find(params.fetch("id").to_i())
  erb(:word_definitions_form)
end


post("/definitions") do
  definition = params.fetch("definition")
  @definition = Definition.new(definition)
  @definition.save()
  @word = Word.find(params.fetch("word_id").to_i())
  @word.add_definition(@definition)
  erb(:word)
end
