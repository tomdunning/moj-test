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
      it 'returns anagrams for the word' do
        get :index, params: { words: ['crepitus'] }
        debugger
        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response).to eq({
          'crepitus' => []
        })
      end
    end
  end

end
