require("rspec")
require("word")

describe(Word) do

  describe("all") do
    it("returns the empty array of @@words") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("save") do
    it("tests for the existance of a saved test_word") do
      test_word = Word.new("BadWolf")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

end
