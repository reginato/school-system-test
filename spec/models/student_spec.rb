require 'spec_helper'

describe Student do
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:group_id) }    
  it { should validate_presence_of(:name) }
  
  it { should belong_to(:group) }  
end
