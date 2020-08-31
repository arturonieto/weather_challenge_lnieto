require 'rails_helper'

RSpec.describe "favorite_cities/new", type: :view do
  before(:each) do
    assign(:favorite_city, FavoriteCity.new())
  end

  it "renders new favorite_city form" do
    render

    assert_select "form[action=?][method=?]", favorite_cities_path, "post" do
    end
  end
end
