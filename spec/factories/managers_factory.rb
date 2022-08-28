FactoryBot.define do
  factory :manager do
    contact_number { Faker::PhoneNumber.phone_number }

    trait :invalid do
      contact_number { "" }
    end
  end
end
