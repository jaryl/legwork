class Admin < ApplicationRecord
  has_one :profile, as: :profileable, required: true
end
