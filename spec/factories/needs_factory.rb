FactoryBot.define do
  factory :need do
    beneficiary
    manager

    nature { "Medical" }

    trait :invalid do
      nature { "" }
    end
  end
end
