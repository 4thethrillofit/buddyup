FactoryGirl.define do
  factory :person, aliases: [:member] do
    sequence(:name) { |n| "Joe#{n} Moe"}
    sequence(:email) { |n| "person#{n}@gmail.com" }
    team_names 'bears, lions'
  end

  factory :team do
    sequence(:name) { |n| "Team#{n}" }
  end

  factory :buddy_pair do
    sequence(:permutation) { |n| [n, n+1] }
    sequence(:team_id) { |n| n }
  end
end