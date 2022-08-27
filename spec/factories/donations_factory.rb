FactoryBot.define do
  factory :donation do
    donor

    trait :invalid do
      donor { nil }
    end
  end
end
