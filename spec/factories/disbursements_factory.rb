FactoryBot.define do
  factory :disbursement do
    need

    trait :invalid do
      need { nil }
    end
  end
end
