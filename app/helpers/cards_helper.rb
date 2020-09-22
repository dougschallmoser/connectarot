module CardsHelper
  def display_card_number_if_major(card)
    " (#{card.number})" if card.designation == "Major"
  end

  def display_link_by_designation(card, designation)
    if card.designation == designation 
      content_tag(:tr) do 
        content_tag(:td) do
          concat link_to(card.name, card_path(card))
        end
      end
    end
  end
end