class WelcomeController < ApplicationController

  def index
    @imageSlider = Dir.glob("#{Rails.root}/app/assets/images/slider/*.jpg")
    @places = ['Bares', 'Playas', 'Cines', 'Restaurantes', 'Gimnasios', 'Tiendas', 'Deportes', 'Oficinas']
  end

end
