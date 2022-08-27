class Need < ApplicationRecord
  belongs_to :beneficiary
  belongs_to :manager

  has_many :disbursements

  validates :nature, presence: true
end
