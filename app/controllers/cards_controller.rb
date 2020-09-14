class CardsController < ApplicationController

    def show
        @card = Card.find_by(id: params[:id])
    end

end