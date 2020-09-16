class Card < ApplicationRecord
    
    has_many :entries_cards
    has_many :entries, through: :entries_cards
    has_many :users, through: :entries
    
    scope :randomize, -> {all.sample}
    # scope :this_month, -> { joins(:entries).where("entries.created_at = ?", "Time.now.beginning_of_month..Time.now.end_of_month") }
    scope :select_duplicates, -> { select(:name).group(:name).having("count(*) > 2").size }

end
