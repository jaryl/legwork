class Manager < ApplicationRecord
  has_one :profile, as: :profileable, required: true

  has_many :campaigns
  has_many :needs
  has_many :updates

  validates :contact_number, presence: true

  accepts_nested_attributes_for :profile, update_only: true

  delegate :display_name, to: :profile
end
