class CardsController < ApplicationController
  before_action :require_login

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find_by(id: params[:id])
    if @card.nil?
      flash[:message] = "The requested page does not exist"
      redirect_to cards_path
    end
  end
end