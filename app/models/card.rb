class Card < ApplicationRecord
  has_many :entries_cards
  has_many :entries, through: :entries_cards
  has_many :users, through: :entries
  scope :randomize, -> {all.sample}
  scope :select_duplicates, -> { select(:name).group(:name).having("count(*) > 2").size }
  
end
