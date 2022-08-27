class Donation < ApplicationRecord
  has_one :transaction_record, as: :transactable

  belongs_to :donor
end
