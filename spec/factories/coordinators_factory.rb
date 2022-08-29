FactoryBot.define do
  factory :coordinator do
    profile { association :profile, profileable: instance }

    contact_methods { [{ type: "telegram", value: "@johndoe" }] }

    trait :invalid do
      profile { nil }
      contact_methods { [] }
    end
  end
end
