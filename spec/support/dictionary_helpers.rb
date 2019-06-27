module DictionaryHelpers

  def create_dictionary_words(words)
    words.each { |word| DictionaryEntry.create!(word: word) }
  end

end
