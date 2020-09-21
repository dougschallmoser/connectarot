class Request < ApplicationRecord

  belongs_to :requestor, class_name: "User"
  belongs_to :responder, class_name: "User", optional: true
  has_one :entry
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validate :different_responder
  scope :all_open_requests, -> { order(:responder_id) }
  scope :by_recent , -> { order(created_at: :desc) }

  def self.search_by_name(name)
    if name.present?
      self.select do |request|
        request.requestor.name.titlecase.include?(name.titlecase) ||
        (request.responder.name.titlecase.include?(name.titlecase) if request.responder.present?)
      end
    else
      self.all
    end
  end

  def different_responder 
    if self.responder == self.requestor
      self.errors.add(:you, "cannot accept your own request")
    end
  end

  def display_date_created
    self.created_at.strftime("%B %e, %Y at %l:%M%p")
  end

  def display_date_updated
    self.updated_at.strftime("%B %e, %Y at %l:%M%p")
  end
    
end
