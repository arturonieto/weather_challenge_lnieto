require "rails_helper"

RSpec.describe FavoriteCitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/favorite_cities").to route_to("favorite_cities#index")
    end

    it "routes to #new" do
      expect(:get => "/favorite_cities/new").to route_to("favorite_cities#new")
    end

    it "routes to #show" do
      expect(:get => "/favorite_cities/1").to route_to("favorite_cities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/favorite_cities/1/edit").to route_to("favorite_cities#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/favorite_cities").to route_to("favorite_cities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/favorite_cities/1").to route_to("favorite_cities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/favorite_cities/1").to route_to("favorite_cities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/favorite_cities/1").to route_to("favorite_cities#destroy", :id => "1")
    end
  end
end
