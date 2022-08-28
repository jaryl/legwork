class Disbursement < ApplicationRecord
  has_one :transaction_record, as: :transactable
  accepts_nested_attributes_for :transaction_record

  has_one :pool, through: :transaction_record

  belongs_to :need
end
