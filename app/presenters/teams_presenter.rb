class TeamsPresenter < BasePresenter
  attr_reader :team_presenters
  def initialize(team, template)
    super(team, template)
    @team_presenters = team.map { |team| TeamPresenter.new(team, template) }
  end

  def names
    team_presenters.map { |team| team.name }
  end
end