class User < ApplicationRecord
  self.per_page = 7

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save {self.email = email.downcase }
  
  validates :name, presence: true, length: { maximum: 50}
  validates :email, presence: true, length: { maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}


  
  
  def self.function_a
    
  end
  # VALID_EMAIL_REGEX = /\A[\w+\-.2-]+@[a-z\d\-.]+\.[a-z]+\z/i

  # before_save { email.downcase! }

  # validates :name, presence: true, length: { maximum: 50 }
  # validates :email, presence: true, length: { maximum: 1000 },
  #   format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  # has_secure_password
  # validates :password, presence: true, length: { minimum: 6 }
end
