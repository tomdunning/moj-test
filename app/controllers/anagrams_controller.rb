class AnagramsController < ApplicationController
  def index
    if params[:words].blank?
      return render json: {
          errors: { words: "At least one word is required" }
        }, status: :unprocessable_entity
    end

    results = {}
    params[:words].each do |word|
      results[word] = DictionaryEntry.where(char_sorted_word: sorted_word(word)).pluck(:word)
    end

    render json: results, status: :ok
  end

  private

  def sorted_word(word)
    word.chars.sort.join('')
  end
end
