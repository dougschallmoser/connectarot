class Entry < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :request, optional: true
  has_many :thoughts
  has_many :entries_cards
  has_many :cards, through: :entries_cards
  validates :interpretation_1, :interpretation_2, :interpretation_3, presence: true, if: -> { request_id.present? }
  validates_presence_of :category, :message => "A spread must be selected from the menu or created with three custom questions"
  validates_presence_of :card_ids, presence: true, if: -> { request_id.present? }, :message => "- All three cards must be selected"
  validates_length_of :card_ids, maximum: 3
  validate :card_id_uniqueness
  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :major_cards, -> { joins(:cards).where("cards.designation = ?", "Major") }
  scope :minor_cards, -> { joins(:cards).where("cards.designation = ?", "Minor") }
  scope :court_cards, -> { joins(:cards).where("cards.court = ?", true) }
  scope :cup_cards, -> { joins(:cards).where("cards.suit = ?", "Cups") }
  scope :pentacle_cards, -> { joins(:cards).where("cards.suit = ?", "Pentacles") }
  scope :sword_cards, -> { joins(:cards).where("cards.suit = ?", "Swords") }
  scope :wand_cards, -> { joins(:cards).where("cards.suit = ?", "Wands") }

  def card_id_uniqueness
    errors.add(:card, "cannot be selected twice from the same deck") unless card_ids == card_ids.uniq
  end
    
  def add_randomized_card
    until !self.cards.include?(random_card = Card.randomize) do
      random_card = Card.randomize
    end
    self.cards << random_card
  end

  def category_attributes=(category_attributes)
    if category_attributes[:question_1].present? && category_attributes[:question_2].present? && category_attributes[:question_3].present?
      self.build_category(category_attributes)
    end
  end

  def self.filter_by_spread(category_name)
    category_name.present? ? self.joins(:category).where(categories: {name: category_name} ) : self.all
  end

  def self.filter_by_card(card_id)
    card_id.present? ? self.joins(:cards).where("cards.id = ?", card_id) : self.all
  end

  def self.total_cards
    self.all.size * 3
  end

  def display_date_created
    self.created_at.strftime("%B %e, %Y at %l:%M%p")
  end

  def display_date_created_short
    self.created_at.strftime("%B %e, %Y")
  end
end
