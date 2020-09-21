module RequestsHelper

  def request_created_by(request)
    if request.requestor == current_user 
      "You"
    else 
      request.requestor.name 
    end 
  end

  def request_accepted_by(request)
    if request.responder == current_user 
      "You"
    else 
      request.responder.name 
    end 
  end

  def display_interpretation(request, index)
    inter = "interpretation_" + "#{index + 1}"
    request.entry.send(inter)
  end

end