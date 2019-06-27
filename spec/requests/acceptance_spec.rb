require 'rails_helper'

RSpec.describe "Acceptance Tests", type: :request do

  before :each do
    # transactional specs aren't working. I'd fix this normally but am short on time
    DictionaryEntry.delete_all
  end

  after :each do
    DictionaryEntry.delete_all
  end

  describe "GET /crepitus" do

    let(:db_words) { ["crepitus", "cuprites","pictures","piecrust"] }

    it "returns anagrams for each word" do
      create_dictionary_words(db_words)

      get '/crepitus'
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json_response).to eq({"crepitus" => ["cuprites","pictures","piecrust"]})
    end
  end

  describe "GET /crepitus,paste,kinship,enlist,boaster,fresher,sinks,knits,sort" do
    let(:db_words) { ["boaster", "boaters", "borates", "crepitus", "cuprites", "elints", "enlist", "fresher", "inlets", "kinship", "knits", "listen", "orts", "paste", "pates", "peats", "pictures", "piecrust", "pinkish", "rebatos", "refresh", "rots", "septa", "silent", "sinks", "skins", "skint", "sorbate", "sort", "spate", "stink", "stor", "tapes", "tepas", "tinks", "tinsel", "tors"] }

    it "returns anagrams for each word" do
      create_dictionary_words(db_words)

      get '/crepitus,paste,kinship,enlist,boaster,fresher,sinks,knits,sort'
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json_response).to eq({
        "crepitus" => ["cuprites","pictures","piecrust"],
        "paste" => ["pates","peats","septa","spate","tapes","tepas"],
        "kinship" => ["pinkish"],
        "enlist" => ["elints","inlets","listen","silent","tinsel"],
        "boaster" => ["boaters","borates","rebatos","sorbate"],
        "fresher" => ["refresh"],
        "sinks" => ["skins"],
        "knits" => ["skint","stink","tinks"],
        "sort" => ["orts","rots","stor","tors"]
      })
    end
  end

  describe "GET /sdfwehrtgegfg" do
    let(:db_words) { [] }
    it "returns anagrams for each word" do
      create_dictionary_words(db_words)

      get '/sdfwehrtgegfg'
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json_response).to eq({"sdfwehrtgegfg" => []})
    end
  end


  describe "GET /he's" do
    let(:db_words) { ['she'] }
    it "returns anagrams for each word" do
      create_dictionary_words(db_words)

      get "/he's"
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json_response).to eq({"he's" => []})
    end
  end
end


