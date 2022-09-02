FactoryBot.define do
  factory :campaign do
    need
    manager
    pool

    status { :draft }

    title { Faker::GreekPhilosophers.quote }
    description { Faker::Lorem.paragraphs.join("\n") }

    start_date { 10.days.ago }
    end_date { 10.days.from_now }

    funding_goal { 1000 }

    trait :invalid do
      pool { nil }
      description { "" }
      funding_goal { -100 }
    end
  end
end
