class Request < ApplicationRecord

    belongs_to :requestor, class_name: "User"
    belongs_to :responder, class_name: "User", optional: true

    validates :title, presence: true, length: { minimum: 3 }
    validates :description, presence: true
    
end
