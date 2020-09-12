class User < ApplicationRecord

    has_secure_password

    has_many :entries
    has_many :cards, through: :entries
    
end
