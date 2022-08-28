FactoryBot.define do
  factory :transaction_record do
    pool

    value { 100 }

    trait :invalid do
      value { "invalid value" }
    end
  end
end
