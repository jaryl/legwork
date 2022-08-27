class Beneficiary < ApplicationRecord
  has_many :cases

  enum gender: {
    male: "male",
    female: "female",
  }

  validates :full_name, presence: true
end
