class Manager < ApplicationRecord
  has_one :profile, as: :profileable

  validates :contact_number, presence: true
end
