class Case < ApplicationRecord
  belongs_to :beneficiary
  belongs_to :manager

  validates :nature, presence: true
end
