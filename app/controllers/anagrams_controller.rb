class AnagramsController < ApplicationController
  def index
    if params[:words].blank?
      return render json: {
          errors: { words: "At least one word is required" }
        }, status: :unprocessable_entity
    end

    words = params[:words]
    words = words.split(',') if params[:words].is_a?(String)

    results = {}
    words.each do |word|
      results[word] = results_for_word(word)
    end

    render json: results, status: :ok
  end

  private

  def sorted_word(word)
    word.chars.sort.join('')
  end

  def results_for_word(word)
    DictionaryEntry.where(char_sorted_word: sorted_word(word)).where.not(word: word).pluck(:word)
  end
end
