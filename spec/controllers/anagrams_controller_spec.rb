require 'rails_helper'

RSpec.describe AnagramsController, type: :controller do

  describe "GET #index" do
    context 'without a word' do
      it "returns http unprocessable entity" do
        get :index
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with one word' do
      let(:db_words) { ["cuprites","pictures","piecrust", "crepitus"] }


      before do
        db_words.each do |word|
          DictionaryEntry.create!(word: word)
        end
      end

      it 'returns anagrams for the words, excluding self' do
        get :index, params: { words: ['crepitus'] }

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response).to eq({
          'crepitus' => ["cuprites","pictures","piecrust"]
        })
      end
    end
  end

end
