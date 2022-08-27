FactoryBot.define do
  factory :manager do
    profile

    contact_number { Faker::PhoneNumber.phone_number }

    trait :invalid do
      contact_number { "" }
    end
  end
end
