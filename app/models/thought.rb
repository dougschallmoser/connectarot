class Thought < ApplicationRecord
  belongs_to :entry
  validates :content, presence: true

  def display_date_created
    self.created_at.strftime("%B %e, %Y at %l:%M%p")
  end
end
