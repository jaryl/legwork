FactoryBot.define do
  factory :donor do
    name { Faker::Name.name }

    trait :invalid do
      name { "" }
    end
  end
end
