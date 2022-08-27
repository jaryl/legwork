FactoryBot.define do
  factory :assignment do
    association :case
    association :manager

    trait :invalid do
      manager { nil }
    end
  end
end
