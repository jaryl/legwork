class Coordinator < ApplicationRecord
  has_one :profile, as: :profileable, required: true
  has_many :pools, as: :handler

  validate :at_least_one_contact_method

  accepts_nested_attributes_for :profile, update_only: true

  def contact_methods
    super.map { |params| ContactMethod.new(params) }
  end

  def contact_methods_attributes=(params)
    self.contact_methods = params.map { |_, values| ContactMethod.new(values) }
  end

  private

  def at_least_one_contact_method
    errors.add(:contact_methods, "At least one contact method") if contact_methods.empty?
  end
end
