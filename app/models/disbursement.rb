class Disbursement < ApplicationRecord
  has_one :transaction_record, as: :transactable

  belongs_to :need
end
