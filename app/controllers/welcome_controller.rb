class WelcomeController < ApplicationController

  def index
    @imageSlider = Dir.glob("#{Rails.root}/app/assets/images/slider/*.jpg")
    @places = ['Bares', 'Playas', 'Cines', 'Restaurantes', 'Gimnasios', 'Tiendas', 'Deportes', 'Oficinas']

  end

  def get_locations
    @locations = Place.all.pluck(:lugar,:latitude,:longitude)
    
    respond_to do |format|
      format.json { render json: @locations }
    end
  end

end
