FactoryBot.define do
  factory :admin do
    profile { association :profile, profileable: instance }

    trait :invalid do
      profile { nil }
    end
  end
end
