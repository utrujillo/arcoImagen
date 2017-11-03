module Admin
  class CatLabelController < ApplicationController
    before_action :authenticate_user!
    layout 'admininterface'

    def index
    end

    def new
    end

    def edit
    end

    def show
    end
  end
end
