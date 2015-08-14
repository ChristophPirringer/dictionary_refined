class Word
  @@words = []

  def initialize(word_entry)
    @word_entry = word_entry
    @id = @@words.length().+1
    @definitions = []
  end

  def word_entry
    @word_entry
  end

  def id
    @id
  end

  def definitions
    @definitions
  end

  define_singleton_method(:all) do
    @@words
  end
end
