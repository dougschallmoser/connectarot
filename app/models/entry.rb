class Entry < ApplicationRecord

    belongs_to :user
    has_many :thoughts
    has_many :entries_cards
    has_many :cards, through: :entries_cards
    
end
