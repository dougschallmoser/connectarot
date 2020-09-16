class CardsController < ApplicationController

    def index
        @cards = Card.all
    end

    def show
        @card = Card.find_by(id: params[:id])
    end

end