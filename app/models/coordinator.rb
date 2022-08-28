class Coordinator < ApplicationRecord
  has_one :profile, as: :profileable
  has_many :pools, as: :handler

  validate :at_least_one_contact_method

  def active_pool
    # TODO: replace with actual implementation
    @active_pool ||= self.pools.first
  end

  private

  def at_least_one_contact_method
    errors.add(:contact_methods, "At least one contact method") if contact_methods.empty?
  end
end
