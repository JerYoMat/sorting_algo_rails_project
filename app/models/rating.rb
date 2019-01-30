class Rating < ApplicationRecord
  #ASSOCIATIONS
  belongs_to :user 
  belongs_to :tip 

  #VALIDATIONS 
  validates :user_id, presence: true
  validates :tip_id, presence: true 
  validates :stars, presence: true 

end
