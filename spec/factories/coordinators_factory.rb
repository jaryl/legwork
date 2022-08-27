FactoryBot.define do
  factory :coordinator do
    profile

    contact_methods { [{ type: "telegram", value: "@johndoe" }] }

    trait :invalid do
      contact_methods { [] }
    end
  end
end
