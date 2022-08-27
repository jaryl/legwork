class Beneficiary < ApplicationRecord
  enum gender: {
    male: "male",
    female: "female",
  }

  validates :full_name, presence: true
end
