class WelcomeController < ApplicationController

  def index
    @imageSlider = Dir.glob("#{Rails.root}/app/assets/images/slider/*.jpg")
  end

end
