class RequestsController < ApplicationController

    before_action :set_request, only: [:show, :update, :destroy]
    before_action :require_login

    def index
        @requests = Request.all.order(created_at: :desc)
    end

    def show
        @request = Request.find_by(id: params[:id])
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
            @request.responder_id = current_user.id 
            if @request.save
                render :show 
            end
        else
            redirect_to requests_path, :notice => "You cannot accept your own request"
        end
    end

    private

    def set_request 
        @request = Request.find_by(id: params[:id])
    end

    def request_params
        params.require(:request).permit(:title, :requestor_id)
    end

end