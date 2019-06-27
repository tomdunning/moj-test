require 'spec_helper'

RSpec.describe "Acceptance Tests", type: :request do
  describe "GET /crepitus" do
    it "works! (now write some real specs)" do
      get root_path('crepitus')
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json_response).to eq({"crepitus":["cuprites","pictures","piecrust"]})
    end
  end

  describe "GET /crepitus,paste,kinship,enlist,boaster,fresher,sinks,knits,sort" do
    it "works! (now write some real specs)" do
      get root_path('crepitus,paste,kinship,enlist,boaster,fresher,sinks,knits,sort')
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json_response).to eq({
        "crepitus":["cuprites","pictures","piecrust"],
        "paste":["pates","peats","septa","spate","tapes","tepas"],
        "kinship":["pinkish"],
        "enlist":["elints","inlets","listen","silent","tinsel"],
        "boaster":["boaters","borates","rebatos","sorbate"],
        "fresher":["refresh"],"sinks":["skins"],
        "knits":["skint","stink","tinks"],
        "sort":["orts","rots","stor","tors"]
      })
    end
  end

  describe "GET /sdfwehrtgegfg" do
    it "works! (now write some real specs)" do
      get root_path('sdfwehrtgegfg')
      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)
      expect(json_response).to eq({"sdfwehrtgegfg":[]})
    end
  end
end


