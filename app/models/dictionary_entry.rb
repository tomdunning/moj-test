class DictionaryEntry < ApplicationRecord

  validates :word, :char_sorted_word, presence: true

  def sort_word
    char_sorted_word = word.chars.sort.join('')
  end
end
