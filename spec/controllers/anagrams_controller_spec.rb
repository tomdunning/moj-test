require 'rails_helper'

RSpec.describe AnagramsController, type: :controller do


  before :each do
    DictionaryEntry.delete_all
  end

  after :each do
    DictionaryEntry.delete_all
  end

  describe "GET #index" do
    context 'without a word' do
      it "returns http unprocessable entity" do
        get :index
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with one word' do
      let(:db_words) { ["cuprites","pictures","piecrust", "crepitus"] }

      it 'returns anagrams for the words, excluding self' do
        create_dictionary_words(db_words)

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
