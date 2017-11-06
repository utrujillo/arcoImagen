module Admin
  class PlacesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_place, only: [:show, :edit, :update, :destroy]
    layout 'admininterface'

    def index
      @places = Place.all.order(id: :desc)
    end

    def new
      @place = Place.new
    end

    def create
      @place = Place.new place_params

      respond_to do |format|
        if @place.save
          format.html { redirect_to [ "admin", @place ], notice: 'El lugar ha sido creado' }
        else
          format.html { render :new }
        end
      end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @place.update place_params
          format.html { redirect_to [ "admin", @place ], notice: 'El lugar ha sido actualizado' }
        else
          format.html { render :edit }
        end
      end  
    end

    def show
    end

    def destroy
      @place.destroy
      respond_to do |format|
        format.html { redirect_to admin_places_path, notice: 'El lugar ha sido eliminado' }
      end
    end

    private
      def set_place
        @place = Place.find params[:id]
      end

      def place_params
        params.require(:place).permit(:direccion, :latitude, :longitude, :descripcion_corta, :descripcion_larga, :lugar)
      end
  end
end
