module Admin
  class WelcomeController < ApplicationController
    before_action :authenticate_user!
    layout 'admininterface'
    def index
    end
  end
end
