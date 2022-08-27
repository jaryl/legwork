class Pool < ApplicationRecord
  belongs_to :handler, polymorphic: true

  has_many :transaction_records

  validates :name, presence: true
end
