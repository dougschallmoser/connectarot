Models:

User => :name, :email, :password
Entry => :thoughts, :cards
Thought => :content
Card => :name, :type, :court, :number, :suit, :interpretation
    if court? == true, then :number == nil
    if :type == major, then :suit == nil

------------------

Database Tables:

users => name:string email:string password_digest:string

entries => user_id:integer

thoughts => entry_id:integer

cards => name:string type:string court:boolean number:integer suit:string interpretation:string

entries_cards => entry_id:integer card_id:integer

------------------

Associations:

-User has many entries
-Entry belongs to a user

-Entry has many thoughts
-Thought belongs to an entry

-Entry has many entries_cards
-Entry has many cards through entries_cards
-Card has many entries_cards
-Card has many entries through entries_cards

-User has many cards through entries
-Card has many users through entries

------------------

Views:

-When logged in, last 7 days of pulls
-Reports:Default view is last 30 days from today.

    1) Total cards pulled
    1) # of major vs minor cards
    2) # of court cards pulled out of total
    3) # of cards with numbers for each number if pulled more than 3 times
    4) # of cards for each suit
    5) # of cards pulled more than 3 times? (You pulled Star card 4 times)