class TeamPresenter < BasePresenter
  presents :team

  def name
    team.name.titleize
  end

  def members
    team.members.map do |member|
      PersonPresenter.new(member, @template)
    end
  end
end