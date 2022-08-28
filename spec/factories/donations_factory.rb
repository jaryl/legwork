FactoryBot.define do
  factory :donation do
    transaction_record { association :transaction_record, transactable: instance }
    donor

    trait :invalid do
      donor { nil }
    end
  end
end
