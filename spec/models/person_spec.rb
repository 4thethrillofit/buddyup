require 'spec_helper'

describe Person do
  let(:team1) { build(:team, name: 'bears') }
  let(:team2) { build(:team, name: 'lions') }
  subject(:person) { build(:person, name: 'fei', email: 'fei@gmail.com', team_names: 'bears, lions' ) }

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
        it 'should validate uniqueness of email' do
          person = FactoryGirl.create(:person, name: 'fei', email: 'fei@gmail.com')
          person.should validate_uniqueness_of(:email)
        end
        it { should_not allow_value('sfd.com').for(:email) }
        it { should allow_value('sfd@gmail.com').for(:email) }
        it { should allow_mass_assignment_of(:email) }
        it 'downcases email before saving' do
          person = FactoryGirl.build(:person, name: 'fei', email:'FEi@g.com')
          expect { person.save }.to change {
            person.email
          }.from('FEi@g.com').to('fei@g.com')
        end
      end

      context 'buddy_id' do
        it { should_not allow_mass_assignment_of(:buddy_id) }
      end
    end

    describe 'associations' do
      it { should have_many(:team_assignments) }
      it { should have_many(:teams).through(:team_assignments) }
      it { should belong_to(:buddy_pair) }
    end
  end

  describe "assign teams after create" do
    it 'should assign the person to teams after saving' do
      person.save
      person.teams.map(&:name).should include('bears', 'lions')
    end
  end
end
