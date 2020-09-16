class Request < ApplicationRecord

    belongs_to :requestor, class_name: "User"
    belongs_to :responder, class_name: "User", optional: true
    
end
