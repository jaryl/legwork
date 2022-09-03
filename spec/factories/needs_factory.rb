FactoryBot.define do
  factory :need do
    beneficiary
    manager
    label

    status { :draft }

    description { Faker::Lorem.paragraph }

    trait :invalid do
      description { "" }
    end
  end
end
