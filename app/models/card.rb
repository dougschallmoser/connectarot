class Card < ApplicationRecord

    scope :randomize, -> {all.sample}

    has_many :entries_cards
    has_many :entries, through: :entries_cards
    has_many :users, through: :entries
    
end
