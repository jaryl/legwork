class Coordinator < ApplicationRecord
  has_one :profile, as: :profileable, required: true
  has_many :pools, as: :handler

  validate :at_least_one_contact_method

  private

  def at_least_one_contact_method
    errors.add(:contact_methods, "At least one contact method") if contact_methods.empty?
  end
end
