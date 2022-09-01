FactoryBot.define do
  factory :contact_method do
    type { "telegram" }
    value { Faker::Internet.username }

    trait :invalid do
      type { "" }
      value { "" }
    end
  end
end
