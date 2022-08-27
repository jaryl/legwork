class Update < ApplicationRecord
  belongs_to :campaign
  belongs_to :manager

  validates :body, presence: true
end
