class User < ApplicationRecord

    has_many :entries
    has_many :cards, through: :entries
end
