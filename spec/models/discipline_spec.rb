require 'spec_helper'

describe Discipline do
  it { should allow_mass_assignment_of(:name) }
  it { should validate_presence_of(:name) }
  
  it {should belong_to(:teacher)}
  
  describe "uniqueness" do
    it "should uniqueness name" do
      discipline = Discipline.create(name: "Geografia")
      discipline2 = Discipline.create(name: "Geografia")    
      discipline2.should have(1).errors_on(:name)
    end
  end
end
