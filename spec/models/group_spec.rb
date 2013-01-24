require 'spec_helper'

describe Group do
  [:name, :students_attributes].each do |attribute|
    it { should allow_mass_assignment_of(attribute) }
  end      
  it { should validate_presence_of(:name) }
    
  it { should have_many(:students) }
  
  describe "accepts_nested_attributes_for students" do
    let(:group) { FactoryGirl.create(:group) }
    
    it "should accepts nested attributes for students" do
      expect {
        group.students_attributes = [{name: "Rodrigo Reginato"}]
        group.save
      }.to change(Student, :count).by(1) 
    end      
  end      
end
