module RequestsHelper

  def request_created_by(request)
    if request.requestor == current_user 
      "You"
    else 
      request.requestor.name 
    end 
  end

end