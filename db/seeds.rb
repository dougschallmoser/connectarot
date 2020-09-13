## SEED DATA ##

# Categories

Category.create(name: "The Past, Present, Future Spread", question_1: "What can I learn from my past?", question_2: "What is being offered to me in my present?", question_3: "What opportunity does my future hold?")

Category.create(name: "The Body, Mind, Soul Spread", question_1: "What does my body need?", question_2: "What does my mind need?", question_3: "What does my soul need?")

Category.create(name: "The Obstacle Spread", question_1: "What do I desire in this present moment?", question_2: "What obstacle stands in the way?", question_3: "How can I surmount the obstacle and achieve my desire?")

Category.create(name: "The Truth Spread", question_1: "What do I feel is true in this present moment?", question_2: "What is actually true in this present moment?", question_3: "What can I learn from these two experiences?")

Category.create(name: "The Anxiety Spread", question_1: "What is the root cause of my anxiety?", question_2: "What can my anxiety teach me?", question_3: "What can help ground me during this experience?")


# Cards

Card.create(name: "The Fool", designation: "Major", court: false, number: 0, suit: nil, meaning: "The Fool represents new beginnings, having faith in the future, being inexperienced, not knowing what to expect, having beginner's luck, improvisation and believing in the universe.")

Card.create(name: "The Magician", designation: "Major", court: false, number: 1, suit: nil, meaning: "When the Magician appears in a spread, it points to the talents, capabilities and resources at the querent's disposal to succeed. The message is to tap into one's full potential rather than holding back, especially when there is a need to transform something.")

Card.create(name: "The High Priestess", designation: "Major", court: false, number: 2, suit: nil, meaning: "High Priestess is a card of mystery, stillness and passivity. This card suggests that it is time to retreat and reflect upon the situation and trust your inner instincts to guide you through it. Things around you are not what they appear to be right now.")

Card.create(name: "The Empress", designation: "Major", court: false, number: 3, suit: nil, meaning: "The Empress is traditionally associated with maternal influence, it is the card if you are hoping to start a family. She can represent the creation of life, romance, art, or new business.")