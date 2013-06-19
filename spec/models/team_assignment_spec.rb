require 'spec_helper'

describe TeamAssignment do
  describe 'associations' do
    it { should belong_to(:person) }
    it { should belong_to(:team) }
  end
end
