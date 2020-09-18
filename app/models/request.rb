class Request < ApplicationRecord

    belongs_to :requestor, class_name: "User"
    has_one :entry
    belongs_to :responder, class_name: "User", optional: true
    validates :title, presence: true, length: { minimum: 3 }
    validates :description, presence: true
    validate :different_responder

    scope :all_open_requests, -> { order(:responder_id) }
    scope :by_recent , -> { order(created_at: :desc) }

    def self.search_by_name(name)
        if name.present?
            self.select {|request| request.requestor.name.titlecase.include?(name.titlecase)}
        else
            self.all
        end
    end

    def different_responder 
        if self.responder == self.requestor
            self.errors.add(:you, "cannot accept your own request")
        end
    end
    
end
