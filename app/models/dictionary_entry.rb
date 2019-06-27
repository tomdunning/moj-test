class DictionaryEntry < ApplicationRecord

  validates :word, :char_sorted_word, presence: true

  before_validation :sort_word

  def sort_word
    self.char_sorted_word = word.chars.sort.join('')
  end
end
