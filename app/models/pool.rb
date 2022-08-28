class Pool < ApplicationRecord
  belongs_to :handler, polymorphic: true

  has_many :transaction_records

  enum status: {
    active: "active",
    inactive: "inactive",
  }

  validates :name, presence: true
end
