class TeamMemberPairMailer < ActionMailer::Base
  default from: "codeforceio@gmail.com"

  def weekly_pair(person, buddies, team)
    @person = person
    @buddies = buddies
    @team = team
    mail(:to => "#{person.name} <#{person.email}>", :subject => "Your weekly fun buddy!")
  end
end
