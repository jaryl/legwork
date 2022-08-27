FactoryBot.define do
  factory :case do
    beneficiary

    nature { "Medical" }

    trait :invalid do
      nature { "" }
    end
  end
end
