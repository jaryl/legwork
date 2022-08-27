FactoryBot.define do
  factory :beneficiary do
    full_name { Faker::Name.name }

    trait :invalid do
      full_name { "" }
    end
  end
end
