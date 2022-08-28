FactoryBot.define do
  factory :pool do
    association :handler, factory: :coordinator

    name { Faker::Bank.name }

    scheme_class { "Manual" }

    trait :invalid do
      name { "" }
    end

    trait :active do
      status { :active }
    end

    trait :inactive do
      status { :inactive }
    end
  end
end
