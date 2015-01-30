require 'spec_helper'

describe Discipline do
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:teacher_id) }  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:teacher_id) }  
  
  it {should belong_to(:teacher)}
  it {should have_and_belong_to_many(:groups)}
  
  describe "uniqueness" do
    it "should uniqueness name" do
      teacher = Teacher.create(name: "Professor pardal")
      discipline = Discipline.create(name: "Geografia", teacher_id: teacher.id)
      discipline2 = Discipline.create(name: "Geografia", teacher_id: teacher.id)    
      discipline2.should have(1).errors_on(:name)
    end
  end
end
