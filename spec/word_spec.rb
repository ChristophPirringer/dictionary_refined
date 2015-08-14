require("rspec")
require("word")

describe(Word) do

  describe(".all") do
    it("returns the empty array of @@words") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("tests for the existance of a saved test_word") do
      test_word = Word.new("BadWolf")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".clear") do
    it("tests for the empty array of @@words after saving a test_word and then clearing it") do
      test_word = Word.new("BadWolf")
      test_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of the word-entry in the @@words-array, which as the first entry is 1.") do
      test_word = Word.new("BadWolf")
      test_word.save()
      expect(test_word.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("finds the word-entry through its id-number") do
      test_word = Word.new("BadWolf")
      test_word.save()
      test_word2 = Word.new("CleverBoy")
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  describe("#definitions") do
    it("returns an empty array of definitions for an entry in the @@words-array") do
      test_word = Word.new("BadWolf")
      expect(test_word.definitions()).to(eq([]))
    end
  end


  describe("#add_definition") do
    it("adds a new definition to an entry in the @@words-array") do
      test_word = Word.new("BadWolf")
      test_word.save()
      test_definition = Definition.new("Rose Tyler")
      test_word.add_definition(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end

end
