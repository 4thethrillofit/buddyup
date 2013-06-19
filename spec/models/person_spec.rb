require 'spec_helper'

describe Person do
  let(:person) { FactoryGirl.build(:person, name: 'fei', email: 'fei@gmail.com') }
  subject { person }

  describe 'create new person' do
    context 'with valid information' do
      its(:name) { should eq 'fei' }
      its(:email) { should eq 'fei@gmail.com' }
      it { should be_valid }
    end

    describe 'validations' do
      context 'name' do
        it { should validate_presence_of(:name) }
        it { should allow_mass_assignment_of(:name) }
      end

      context 'email' do
        it { should validate_presence_of(:email) }
        it { should validate_uniqueness_of(:email) }
        it { should_not allow_value('sfd.com').for(:email) }
        it { should allow_value('sfd@gmail.com').for(:email) }
        it { should allow_mass_assignment_of(:email) }
      end

      context 'buddy_id' do
        # it { should validate_uniqueness_of(:buddy_id) }
        # it { should validate_numericality_of(:buddy_id) }
        it { should_not allow_mass_assignment_of(:buddy_id) }
      end
    end
  end
end
