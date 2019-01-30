class LessonTopic < ApplicationRecord
  #ASSOCIATIONS
  has_many :tips 
  has_many :users, through: :tips 

  #VALIDATIONS
  validates :name, presence: true 
  validates :description, presence: true 
  validates :course_order, presence: true 
end
