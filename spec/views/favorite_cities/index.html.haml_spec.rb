require 'rails_helper'

RSpec.describe "favorite_cities/index", type: :view do
  before(:each) do
    assign(:favorite_cities, [
      FavoriteCity.create!(),
      FavoriteCity.create!()
    ])
  end

  it "renders a list of favorite_cities" do
    render
  end
end
