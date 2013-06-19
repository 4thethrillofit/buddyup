require 'spec_helper'

describe Team do
  let(:team) { FactoryGirl.build(:team, name: 'bears') }
  subject { team }

  describe "create new team" do
    context 'with valid information' do
      its(:name) { should eq 'bears' }
      it { should be_valid }
    end

  describe 'validations' do
    context 'name' do
      it { should validate_presence_of(:name) }
      it { should ensure_length_of(:name).is_at_most(10) }
      it { should allow_mass_assignment_of(:name) }
    end
  end

  end
end
