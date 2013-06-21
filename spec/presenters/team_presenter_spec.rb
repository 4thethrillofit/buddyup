require 'spec_helper'

describe TeamPresenter do
  let(:team) { FactoryGirl.create(:team) }
  subject(:presenter) { TeamPresenter.new(team, view) }

  describe '#team' do
    it 'should return the team object' do
      presenter.team.should eq team
    end
  end

  describe '#name' do
    it 'should return the capitalized name of the team' do
      presenter.name.should eq team.name
    end
  end

  # describe '#members' do
  #   it 'should return an array of PersonPresenter objects' do
  #     presenter.team.members.sample.should be_an_instance_of(PersonPresenter)
  #   end
  # end

end