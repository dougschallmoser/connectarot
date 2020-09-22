module CardsHelper

  def display_card_number_if_major(card)
    " (#{card.number})" if card.designation == "Major"
  end

end