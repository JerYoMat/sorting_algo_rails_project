class User < ApplicationRecord
    validates :name, presence: true, length: {maximum: 255}
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255},
     format: { with: EMAIL_REGEX} 
end
