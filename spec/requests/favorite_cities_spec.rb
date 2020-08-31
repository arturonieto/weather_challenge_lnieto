require 'rails_helper'

RSpec.describe "FavoriteCities", type: :request do
  describe "GET /favorite_cities" do
    it "works! (now write some real specs)" do
      get favorite_cities_path
      expect(response).to have_http_status(200)
    end
  end
end
