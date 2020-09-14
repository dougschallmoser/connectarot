class Thought < ApplicationRecord

    belongs_to :entry
    
    validates :content, presence: true
    
end
