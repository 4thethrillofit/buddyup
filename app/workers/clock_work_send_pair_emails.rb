require 'clockwork'
require_relative '../../config/boot'
require_relative '../../config/environment'

include Clockwork

every(5.minute, "Sending weekly pair emails") do
  puts "Sending weekly pair emails"
  Team.all.each do |team|
    team.generate_weekly_pairs.each do |pair|
      pair.each do |person|
        buddies = pair - [person]
        TeamMemberPairMailer.delay.weekly_pair(person, buddies)
      end
    end
  end
  BuddyPair.clean_weekly_pair_records
  puts "Finished sending email."
end

# , :at => '17:00'