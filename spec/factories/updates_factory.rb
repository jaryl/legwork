FactoryBot.define do
  factory :update do
    campaign
    manager

    body { Faker::Lorem.paragraph }

    trait :invalid do
      body { "" }
    end
  end
end
