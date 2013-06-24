class TeamMemberPairMailer < ActionMailer::Base
  default from: "codeforceio@gmail.com"

  def weekly_pair(person, buddies)
    @person = person
    @buddies = buddies
    mail(:to => "#{person.name} <#{person.email}>", :subject => "Your weekly fun buddy!")
  end
end
