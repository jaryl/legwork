class Admin < ApplicationRecord
  has_one :profile, as: :profileable, required: true

  delegate :display_name, to: :profile
end
