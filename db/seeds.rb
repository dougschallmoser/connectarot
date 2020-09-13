## SEED DATA ##

# t.string "name"
# t.string "type"
# t.boolean "court"
# t.integer "number"
# t.string "suit"
# t.string "meaning"
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false

one = Card.create(name: "The Fool", type: "Major", court: false, number: 0, suit: nil, meaning: "The Fool represents new beginnings, having faith in the future, being inexperienced, not knowing what to expect, having beginner's luck, improvisation and believing in the universe.")

two = Card.create(name: "The Magician", type: "Major", court: false, number: 1, suit: nil, meaning: "When the Magician appears in a spread, it points to the talents, capabilities and resources at the querent's disposal to succeed. The message is to tap into one's full potential rather than holding back, especially when there is a need to transform something.")

three = Card.create(name: "The Magician", type: "Major", court: false, number: 1, suit: nil, meaning: "High Priestess is a card of mystery, stillness and passivity. This card suggests that it is time to retreat and reflect upon the situation and trust your inner instincts to guide you through it. Things around you are not what they appear to be right now.")