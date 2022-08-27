class Donor < ApplicationRecord
  validates :name, presence: true
end
