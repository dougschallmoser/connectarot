class User < ApplicationRecord
  has_many :entries
  has_many :cards, through: :entries
  has_many :requests, class_name: "Request", foreign_key: "requestor_id"
  has_many :responses, class_name: "Request", foreign_key: "responder_id"
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  has_secure_password

  def self.find_or_create_by_omniauth(auth_hash)
    self.find_or_create_by(email: auth_hash['info']['email']) do |u| 
      u.name = auth_hash['info']['name']
      u.email = auth_hash['info']['email']
      u.image = auth_hash['info']['image']
      u.password = SecureRandom.hex
    end
  end

  def display_date_created
    self.created_at.strftime("%B %e, %Y")
  end
end
