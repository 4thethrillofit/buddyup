require 'spec_helper'

describe Team do
  let(:member1) { build(:person, id: 1) }
  let(:member2) { build(:person, id: 2) }
  let(:member3) { build(:person, id: 3) }
  subject(:team) { build(:team, name: 'bears') }

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
    it 'should generate a new buddy_pair record for each permutation' do
      team = create(:team)
      team.members << member1
      team.members << member2
      team.members << member3
      expect { team.generate_pair_records }.to change {
        team.buddy_pairs.count
      }.by(3)
    end
  end

  describe '#generate_pair_for_new_member' do
    it 'should generate a buddy_pair for new member with all members of the team' do
      team = create(:team)
      team.members << member1
      team.members << member2
      team.members << member3
      #coupling with #generate_pair_records?
      team.generate_pair_records
      original_pair_count = team.buddy_pairs.count
      expect { team.generate_pair_for_new_member(member1) }.to change {
        team.buddy_pairs.count
      }.by(original_pair_count)
    end
  end

end
