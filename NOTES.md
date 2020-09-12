Models:
User => :name, :username, :email
Entry => :thoughts, :card_ids
Card => name:string, type:integer (major-1, or minor-0), court:boolean, number:string, suit:string, interpretation:string
    if court? == true, then :number == nil
    if :type == major, then :suit == nil

Relationships:
-User has many entries
-Entry belongs to a user

-Entry has many cards
-Card has many entries

-User has many cards through entries
-Card has many users through entries

user.entries #=> Show all entries made by that user
user.cards #=> Show all cards made by that user

card.entries #=> Show all entries that pulled that card

(1) Has_many
(1) Belongs_to
(2) Has_many through
        including a many-many 

Views:
-When logged in, last 7 days of pulls
-Reports:Default view is last 30 days from today.
    -Custom report by dates
1) Total cards pulled
1) # of major vs minor cards
2) # of court cards pulled out of total
3) # of cards with numbers for each number if pulled more than 3 times
4) # of cards for each suit
5) # of cards pulled more than 3 times? (You pulled Star card 4 times)

Form:
-Drop down menu of cards
-Reaction (checkbox)
-Reflection (textarea)