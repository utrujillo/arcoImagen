module Admin
  class CatLabelsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_label, only: [:show, :edit, :update, :destroy]
    layout 'admininterface'

    def index
      @labels = CatLabel.all
    end

    def new
      @label = CatLabel.new
    end

    def create
      @label = CatLabel.new label_params

      respond_to do |format|
        if @label.save
          format.html { redirect_to [ "admin", @label ], notice: 'La Etiqueta ha sido creada'  }
        else
          format.html { render :new }
        end
      end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @label.update label_params
          format.html { redirect_to [ "admin", @label ], notice: 'La Etiqueta ha sido actualizada' }
        else
          format.html { render :edit }
        end
      end
    end

    def show
    end

    def destroy
      @label.destroy
      respond_to do |format|
        format.html { redirect_to admin_cat_labels_path, notice: 'La Etiqueta ha sido eliminada' }
      end
    end

    private
      def set_label
        @label = CatLabel.find params[:id]
      end

      def label_params
        params.require(:cat_label).permit(:nombre)
      end
  end
end
