require 'rails_helper'

RSpec.describe "Notes API", type: :request do
  describe "GET /api/v1/notes" do
    before do
      create_list(:note, 2)
    end

    it "devuelve todas las notas" do
      get "/api/v1/notes"
      
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.size).to eq(2)
    end
  end
end
