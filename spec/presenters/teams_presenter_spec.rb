require 'spec_helper'

describe TeamsPresenter do
  let(:team1) { FactoryGirl.create(:team) }
  let(:team2) { FactoryGirl.create(:team) }
  let(:teams) { [team1, team2] }
  subject(:presenter) { TeamsPresenter.new(teams, view) }

  describe '#initialize' do
    it 'should raise ArgumentError if no arguments are given' do
    expect { TeamsPresenter.new }.to raise_error(ArgumentError)
    end
  end

  describe '#team_presenters' do
    it 'should return an array of TeamPresenter objects' do
      presenter.team_presenters.sample.should be_an_instance_of(TeamPresenter)
    end
  end

  describe '#names' do
    it 'should return an array of capitalized team names' do
      presenter.names.first.should eq teams.first.name.capitalize
    end
  end


end