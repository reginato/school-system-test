require 'spec_helper'

describe Teacher do
  it { should allow_mass_assignment_of(:name) }
  it { should validate_presence_of(:name) }
end
