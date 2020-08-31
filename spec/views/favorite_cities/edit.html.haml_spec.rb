require 'rails_helper'

RSpec.describe "favorite_cities/edit", type: :view do
  before(:each) do
    @favorite_city = assign(:favorite_city, FavoriteCity.create!())
  end

  it "renders the edit favorite_city form" do
    render

    assert_select "form[action=?][method=?]", favorite_city_path(@favorite_city), "post" do
    end
  end
end
