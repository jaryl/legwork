class Beneficiary < ApplicationRecord
  has_many :needs

  enum gender: {
    male: "male",
    female: "female",
  }

  validates :full_name, presence: true
end
