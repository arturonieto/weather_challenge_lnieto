require 'rails_helper'

RSpec.describe "favorite_cities/show", type: :view do
  before(:each) do
    @favorite_city = assign(:favorite_city, FavoriteCity.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
