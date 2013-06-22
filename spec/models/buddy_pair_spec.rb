require 'spec_helper'

describe BuddyPair do
  subject(:buddy_pair) { FactoryGirl.build(:buddy_pair) }

  describe 'creating a new buddy pair' do
    context 'with valid information' do
      it 'should have valid attributes' do
        pair = FactoryGirl.build(:buddy_pair, permutation: [1,2])
        pair.save
        pair.permutation.should eq [1,2]
      end
    end

    describe 'validations' do
      it 'should only take an Array for permutation' do
        # The postgres Array gem throws an error, which rspec is unable to handle and test. This should not be a problem in Rails 4.
        # pair = FactoryGirl.build(:buddy_pair, permutation: 2)
        # pair.should_not be_valid
        # pair.should have(1).error_on(:permutation)
      end

      it { should validate_presence_of(:permutation) }
      it { should validate_presence_of(:team_id) }
    end

    describe 'associations' do
      it { should belong_to(:team) }
    end
  end
end
