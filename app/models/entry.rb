class Entry < ApplicationRecord

    belongs_to :user
    has_many :thoughts
    has_many :entries_cards
    has_many :cards, through: :entries_cards

    validates_length_of :cards, maximum: 3
    
end
