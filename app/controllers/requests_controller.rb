class RequestsController < ApplicationController

    before_action :require_login

    def index
    end
    
    def new
        @request = Request.new
    end


end