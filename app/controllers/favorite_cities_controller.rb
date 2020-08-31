class FavoriteCitiesController < ApplicationController
  before_action :set_favorite_city, only: [:show, :edit, :update, :destroy]

  # GET /favorite_cities
  # GET /favorite_cities.json
  def index
    @favorite_cities = FavoriteCity.all
  end

  # GET /favorite_cities/1
  # GET /favorite_cities/1.json
  def show
  end

  # GET /favorite_cities/new
  def new
    @favorite_city = FavoriteCity.new
  end

  # GET /favorite_cities/1/edit
  def edit
  end

  # POST /favorite_cities
  # POST /favorite_cities.json
  def create
    @favorite_city = FavoriteCity.new(favorite_city_params)

    respond_to do |format|
      if @favorite_city.save
        format.html { redirect_to @favorite_city, notice: 'Favorite city was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_city }
      else
        format.html { render :new }
        format.json { render json: @favorite_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_cities/1
  # PATCH/PUT /favorite_cities/1.json
  def update
    respond_to do |format|
      if @favorite_city.update(favorite_city_params)
        format.html { redirect_to @favorite_city, notice: 'Favorite city was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite_city }
      else
        format.html { render :edit }
        format.json { render json: @favorite_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_cities/1
  # DELETE /favorite_cities/1.json
  def destroy
    @favorite_city.destroy
    respond_to do |format|
      format.html { redirect_to favorite_cities_url, notice: 'Favorite city was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_city
      @favorite_city = FavoriteCity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_city_params
      params.fetch(:favorite_city, {})
    end
end
