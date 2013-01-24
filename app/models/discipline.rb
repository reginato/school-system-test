class Discipline < ActiveRecord::Base
  validates :name,  presence: true
  validates :name, uniqueness: true  
  attr_accessible :name, :teacher_id
  
  belongs_to :teacher
  has_and_belongs_to_many :groups
end
