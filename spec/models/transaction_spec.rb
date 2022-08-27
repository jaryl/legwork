require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { is_expected.to belong_to(:pool) }
  it { is_expected.to belong_to(:transactable) }

  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_numericality_of(:value).only_integer }
end
