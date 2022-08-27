FactoryBot.define do
  factory :case do
    beneficiary
    manager

    nature { "Medical" }

    trait :invalid do
      nature { "" }
    end
  end
end
