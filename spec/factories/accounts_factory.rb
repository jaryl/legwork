FactoryBot.define do
  factory :account do
    email { Faker::Internet.email }

    trait :invalid do
      email { "" }
    end
  end
end
