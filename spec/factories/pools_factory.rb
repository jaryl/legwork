FactoryBot.define do
  factory :pool do
    association :handler, factory: :coordinator

    name { Faker::Bank.name }

    trait :invalid do
      name { "" }
    end
  end
end
