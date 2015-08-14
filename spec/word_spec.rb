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

end
