class Manager < ApplicationRecord
  has_one :profile, as: :profileable

  has_many :campaigns
  has_many :needs

  validates :contact_number, presence: true
end
