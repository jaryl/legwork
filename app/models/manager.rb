class Manager < ApplicationRecord
  has_one :profile, as: :profileable, required: true

  has_many :campaigns
  has_many :needs
  has_many :updates

  validates :contact_number, presence: true
end
