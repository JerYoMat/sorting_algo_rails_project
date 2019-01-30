class Tip < ApplicationRecord
  #ASSOCIATIONS
  belongs_to :user 
  belongs_to :lesson_topic 

  has_many :ratings 
  has_many :users, through: :ratings 

  #VALIDATIONS 
  validates :user_id, presence: true 
  validates :lesson_topic_id, presence: true 
  validates :name, presence: true 
  validates :description, presence: true 
  validates :resource_link, presence: true 

  #SCOPE
  default_scope -> {order(created_at: :desc)}
end
