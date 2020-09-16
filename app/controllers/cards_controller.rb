class CardsController < ApplicationController

    before_action :require_login

    def index
        @cards = Card.all
    end

    def show
        @card = Card.find_by(id: params[:id])
    end

end