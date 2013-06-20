class TeamPresenter < BasePresenter
  presents :team

  def name
    team.name.capitalize
  end

  def members
    team.members.map do |member|
      PersonPresenter.new(member, @template)
    end
  end
end