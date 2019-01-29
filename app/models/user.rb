class User < ApplicationRecord
    before_save { self.email = email.downcase }  #this appears unnecessary, however, as the email address is being indexed, the index may be case sensitive.  To not worry about this the email address is standardized prior to going in the db. 
    validates :name, presence: true, length: {maximum: 255}
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255},
     format: { with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}
    has_secure_password
    validates :password, presence: true,  length: {minimum: 6}
end
