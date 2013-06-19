FactoryGirl.define do
  factory :person do
    sequence(:name) { |n| "Joe#{n} Moe"}
    sequence(:email) { |n| "person#{n}@gmail.com" }
  end

  factory :team do
    sequence(:name) { |n| "Team#{n}" }
  end
end