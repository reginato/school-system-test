class Student < ActiveRecord::Base
  validates :name,  presence: true  
  attr_accessible :name
  
  belongs_to :group
end
