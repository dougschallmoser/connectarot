class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]
  before_action :require_login
  before_action :authorize_requestor_and_responder, only: [:show]

  def index
    @requests = Request.all_open_requests.by_recent
    @requests = @requests.search_by_name(params[:name]) if params[:name]
  end

  def show
    @entry = Entry.new
    @cards = Card.all
  end
  
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      flash[:message] = "Request successfully created"
      redirect_to requests_path
    else
      render :new
    end
  end

  def update
    if @request.update(responder_id: current_user.id)
      flash[:message] = "You have accepted this request"
      redirect_to request_path(@request)
    else
      flash[:message] = @request.errors.full_messages.to_sentence
      redirect_to requests_path
    end
  end

  def destroy
    @user = @request.requestor
    require_authorization
    @request.destroy
    flash[:message] = "Request successfully deleted"
    redirect_to requests_path
  end

  private

  def set_request 
    @request = Request.find_by(id: params[:id])
  end

  def request_params
    params.require(:request).permit(:title, :description, :requestor_id)
  end

  def authorize_requestor_and_responder
    unless @request.requestor == current_user || @request.responder == current_user 
      flash[:message] = "You do not have permission to view that request"
      redirect_to requests_path
    end
  end
end