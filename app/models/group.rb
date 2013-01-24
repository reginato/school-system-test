class Group < ActiveRecord::Base
  attr_accessible :name, :students_attributes
  validates :name,  presence: true  
  
  has_many :students
  accepts_nested_attributes_for :students, :reject_if => :all_blank, :allow_destroy => true
end
