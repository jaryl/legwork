class Donation < ApplicationRecord
  has_one :transaction_record, as: :transactable, required: true
  accepts_nested_attributes_for :transaction_record

  has_one :pool, through: :transaction_record

  belongs_to :donor
  accepts_nested_attributes_for :donor
end
