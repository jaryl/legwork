FactoryBot.define do
  factory :disbursement do
    transaction_record { association :transaction_record, transactable: instance }
    need

    trait :invalid do
      need { nil }
    end
  end
end
