class Group < ActiveRecord::Base
  attr_accessible :name, :students_attributes, :discipline_ids
  validates :name,  presence: true  
  
  has_many :students
  has_and_belongs_to_many :disciplines
  accepts_nested_attributes_for :students, :reject_if => :all_blank, :allow_destroy => true
end
