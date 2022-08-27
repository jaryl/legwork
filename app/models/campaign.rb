class Campaign < ApplicationRecord
  belongs_to :need
  belongs_to :manager
  belongs_to :pool

  validates :funding_goal, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, :start_date, :end_date, presence: true
end
