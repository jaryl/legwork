require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it { is_expected.to belong_to(:need) }
  it { is_expected.to belong_to(:manager) }
  it { is_expected.to belong_to(:pool) }

  it { is_expected.to validate_numericality_of(:funding_goal).only_integer.is_greater_than(0) }
  it { is_expected.to validate_presence_of(:funding_goal) }

  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }

  it { expect(build(:campaign)).to be_valid }
  it { expect(build(:campaign, :invalid)).not_to be_valid }
end
