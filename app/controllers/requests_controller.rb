class RequestsController < ApplicationController

    before_action :require_login

    def index
        @requests = Request.all
    end

    def show
        @request = Request.find_by(id: params[:id])
        if !@request.nil? && @request.requestor_id != current_user.id
            @request.responder_id = current_user.id 
            render :show 
        else
            redirect_to requests_path, :notice => "You cannot accept your own request."
        end
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

    private

    def request_params
        params.require(:request).permit(:title, :requestor_id)
    end

end