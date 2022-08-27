class Pool < ApplicationRecord
  belongs_to :handler, polymorphic: true

  validates :name, presence: true
end
