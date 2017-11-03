module Admin
  class CatPlacesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_cat_place, only: [:show, :edit, :update, :destroy]
    layout 'admininterface'

    # GET /admin/cat_places
    # GET /admin/cat_places.json
    def index
      @cat_places = CatPlace.all
    end

    # GET /admin/cat_places/1
    # GET /admin/cat_places/1.json
    def show
    end

    # GET /admin/cat_places/new
    def new
      @cat_place = CatPlace.new
    end

    # GET /admin/cat_places/1/edit
    def edit
    end

    # POST /admin/cat_places
    # POST /admin/cat_places.json
    def create
      @cat_place = CatPlace.new cat_place_params

      respond_to do |format|
        if @cat_place.save
          format.html { redirect_to ["admin", @cat_place], notice: 'Cat place was successfully created.' }
          format.json { render :show, status: :created, location: @cat_place }
        else
          format.html { render :new }
          format.json { render json: @cat_place.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/cat_places/1
    # PATCH/PUT /admin/cat_places/1.json
    def update
      respond_to do |format|
        if @cat_place.update cat_place_params
          format.html { redirect_to [ "admin", @cat_place ], notice: 'Cat place was successfully updated.' }
          format.json { render :show, status: :ok, location: @cat_place }
        else
          format.html { render :edit }
          format.json { render json: @cat_place.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/cat_places/1
    # DELETE /admin/cat_places/1.json
    def destroy
      @cat_place.destroy
      respond_to do |format|
        format.html { redirect_to admin_cat_places_path, notice: 'Cat place was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cat_place
        @cat_place = CatPlace.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def cat_place_params
        params.require(:cat_place).permit(:nombre)
      end
  end
end
