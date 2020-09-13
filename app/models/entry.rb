class Entry < ApplicationRecord

    belongs_to :user
    has_many :thoughts
    has_many :entries_cards
    has_many :cards, through: :entries_cards

    validates_length_of :cards, maximum: 3

    def add_randomized_card
        until !self.cards.include?(random_card = Card.randomize) do
            random_card = Card.randomize
        end
        self.cards << random_card
    end
    
end
