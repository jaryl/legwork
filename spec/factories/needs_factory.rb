FactoryBot.define do
  factory :need do
    beneficiary
    manager

    status { :draft }

    nature { "Medical" }

    trait :invalid do
      nature { "" }
    end
  end
end
