class User < ApplicationRecord

    has_secure_password
    validates :name, :email, :password, presence: true

    has_many :entries
    has_many :cards, through: :entries
    
end
