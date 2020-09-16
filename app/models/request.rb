class Request < ApplicationRecord

    belongs_to :requestor_user, class_name: "User"
    belongs_to :responder_user, class_name: "User", optional: true
    
end
