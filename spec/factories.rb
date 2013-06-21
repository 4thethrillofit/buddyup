FactoryGirl.define do
  factory :person, aliases: [:member] do
    sequence(:name) { |n| "Joe#{n} Moe"}
    sequence(:email) { |n| "person#{n}@gmail.com" }
  end

  factory :team do
    sequence(:name) { |n| "Team#{n}" }
    # factory :team_with_members do
    #   ignore do
    #     member_count 5
    #   end
    #   after(:create) do |member, evaluator|
    #     FactoryGirl.create_list(:person, 3, member: member)
    #   end
    # end
  end
end