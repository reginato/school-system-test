class Discipline < ActiveRecord::Base
  validates :name,  presence: true
  validates :name, uniqueness: true  
  attr_accessible :name
  
  belongs_to :teacher
end
