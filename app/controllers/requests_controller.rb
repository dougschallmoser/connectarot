class RequestsController < ApplicationController

    before_action :set_request, only: [:show, :update, :destroy]
    before_action :require_login

    def index
        @requests = Request.all.order(created_at: :desc)
    end

    def show
        @request = Request.find_by(id: params[:id])
        @entry = Entry.new
    end
    
    def new
        @request = Request.new
    end

    def create
        @request = Request.new(request_params)
        if @request.save
            redirect_to requests_path
        else
            render :new
        end
    end

    def update
        if !@request.nil? && @request.requestor_id != current_user.id
            if @request.update(responder_id: current_user.id)
                render :show 
            end
        else
            flash[:error] = "You cannot accept your own request"
            redirect_to requests_path
        end
    end

    private

    def set_request 
        @request = Request.find_by(id: params[:id])
    end

    def request_params
        params.require(:request).permit(:title, :description, :requestor_id)
    end

end