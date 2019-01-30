class Tip < ApplicationRecord
  #ASSOCIATIONS
  belongs_to :user 
  belongs_to :lesson_topic 

  has_many :ratings 
  has_many :users, through: :ratings 
end
