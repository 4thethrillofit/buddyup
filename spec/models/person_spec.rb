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
    end
  end
end
