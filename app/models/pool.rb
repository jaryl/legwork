class Pool < ApplicationRecord
  belongs_to :handler, polymorphic: true

  has_many :transactions

  validates :name, presence: true
end
