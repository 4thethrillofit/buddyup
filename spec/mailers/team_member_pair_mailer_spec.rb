require "spec_helper"

describe TeamMemberPairMailer do
  let(:person) { build(:person) }
  let(:buddy) { build(:person) }
  subject(:mailer) { TeamMemberPairMailer.weekly_pair(person, [buddy]) }

  describe 'send weekly pairs' do
    it 'sends weekly buddies to people' do
      mailer.subject.should eq "Your weekly fun buddy!"
      mailer.from.should eq ["codeforceio@gmail.com"]
      mailer.to.should eq [person.email]
    end
  end
end
