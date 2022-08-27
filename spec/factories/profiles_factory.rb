FactoryBot.define do
  factory :profile do
    account

    display_name { Faker::Name.name }

    trait :invalid do
      display_name { "" }
    end
  end
end
