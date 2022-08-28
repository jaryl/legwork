FactoryBot.define do
  factory :pool do
    association :handler, factory: :coordinator

    name { Faker::Bank.name }

    scheme_class { "Manual" }

    trait :invalid do
      name { "" }
    end
  end
end
