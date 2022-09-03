class Admin < ApplicationRecord
  has_one :profile, as: :profileable, required: true

  delegate :display_name, to: :profile

  accepts_nested_attributes_for :profile, update_only: true
end
