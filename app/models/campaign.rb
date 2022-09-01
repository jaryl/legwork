class Campaign < ApplicationRecord
  belongs_to :manager
  belongs_to :need, optional: true
  belongs_to :pool, optional: true

  has_many :updates

  validates :funding_goal, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, :start_date, :end_date, presence: true
end
