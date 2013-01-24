class Student < ActiveRecord::Base
  validates :name,  presence: true  
  attr_accessible :name, :group_id
  
  belongs_to :group
end
