require("rspec")
require("word")

describe(Word) do

  describe("all") do
    it("returns the empty array of @@words") do
      expect(Word.all()).to(eq([]))
    end
  end

end
