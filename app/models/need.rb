class Need < ApplicationRecord
  belongs_to :beneficiary
  belongs_to :manager
  belongs_to :label

  has_many :disbursements

  validates :description, presence: true
end
