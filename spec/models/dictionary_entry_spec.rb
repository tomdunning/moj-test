require 'rails_helper'

RSpec.describe DictionaryEntry, type: :model do

  subject { described_class.new(params) }

  describe '#valid?' do
    context 'with a word and char_sorted_word value' do
      let(:params) { { word: 'crepitus', char_sorted_word: 'ceiprstu'} }
      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'without a word' do
      let(:params) { { word: '', char_sorted_word: 'ceiprstu'} }
      it 'returns an error' do
        expect(subject).not_to be_valid
        expect(subject.errors[:word]).to include("can't be blank")
      end
    end

    context 'without a char_sorted_word' do
      let(:params) { { word: 'crepitus', char_sorted_word: ''} }
      it 'is assigned and is valid' do
        expect(subject).to be_valid
      end
    end
  end


  describe '#sort_word' do
    let(:params) { { word: 'crepitus' } }
    it 'sets the char_sorted_word' do
      expect(subject.sort_word).to eq('ceiprstu')
    end

    context 'with special characters' do
      let(:params) { { word: "he's!" } }
      it 'sets the char_sorted_word' do
        expect(subject.sort_word).to eq("!'ehs")
      end
    end
  end
end
