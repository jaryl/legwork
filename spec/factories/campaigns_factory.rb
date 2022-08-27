FactoryBot.define do
  factory :campaign do
    association :case
    association :manager
    association :pool

    description { Faker::Lorem.paragraphs }

    start_date { 10.days.ago }
    end_date { 10.days.from_now }

    funding_goal { 1000 }

    trait :invalid do
      pool { nil }
    end
  end
end
