FactoryBot.define do
  factory :label do
    name { Faker::Company.industry }

    trait :invalid do
      name { "" }
    end
  end
end
