require 'spec_helper'

describe Team do
  let(:member1) { build(:person, id: 1) }
  let(:member2) { build(:person, id: 2) }
  let(:member3) { build(:person, id: 3) }
  subject(:team) { create(:team, name: 'bears') }

  describe "create new team" do
    context 'with valid information' do
      its(:name) { should eq 'bears' }
      it { should be_valid }
    end
  end

  describe 'validations' do
    context 'name' do
      it { should validate_presence_of(:name) }
      it { should ensure_length_of(:name).is_at_most(10) }
      it { should allow_mass_assignment_of(:name) }
    end
  end

  describe 'associations' do
    it { should have_many(:team_assignments) }
    it { should have_many(:members).through(:team_assignments) }
    it { should have_many(:buddy_pairs) }
  end

  describe '#generate_pairs' do
    before {
        team.members << member1
        team.members << member2
        team.members << member3
    }

    describe '#generate_permutations' do
      it "should generate a set of unique pairs for each member of the team" do
        team.generate_permutations.should eq [[1, 2], [1, 3], [2, 3]]
      end
    end

    it 'should generate a new buddy_pair record for each permutation' do
      expect { team.generate_pair_records }.to change {
        team.buddy_pairs.count
      }.by(3)
    end
  end

end
