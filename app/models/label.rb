class Label < ApplicationRecord
  has_many :needs

  validates :name, presence: true
end
