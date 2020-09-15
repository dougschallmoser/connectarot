class Entry < ApplicationRecord

    belongs_to :category
    belongs_to :user
    has_many :thoughts
    has_many :entries_cards
    has_many :cards, through: :entries_cards

    validates_length_of :cards, maximum: 3

    scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

    def add_randomized_card
        until !self.cards.include?(random_card = Card.randomize) do
            random_card = Card.randomize
        end
        self.cards << random_card
    end

    def self.designation(designation)
        self.joins(:cards).where("cards.designation = ?", "#{designation}")
    end

    def self.court_cards
        self.joins(:cards).where("cards.court = ?", "true")
    end
    
end
