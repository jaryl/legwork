class Transaction < ApplicationRecord
  delegated_type :transactable, types: %w[Disbursement Donation], dependent: :destroy

  belongs_to :pool

  validates :value, presence: true, numericality: { only_integer: true }
end
