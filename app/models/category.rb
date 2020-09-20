class Category < ApplicationRecord

  has_many :entries
  validates :question_1, :question_2, :question_3, presence: true
    
end
