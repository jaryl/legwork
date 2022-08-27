class Profile < ApplicationRecord
  delegated_type :profileable, types: %w[Admin Manager Coordinator], dependent: :destroy

  belongs_to :account

  validates :display_name, presence: true
end
