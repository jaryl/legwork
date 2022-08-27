class Case < ApplicationRecord
  belongs_to :beneficiary

  validates :nature, presence: true
end
