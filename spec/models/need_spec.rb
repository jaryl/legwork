require 'rails_helper'

RSpec.describe Need, type: :model do
  it { is_expected.to belong_to(:beneficiary) }
  it { is_expected.to belong_to(:manager) }
  it { is_expected.to belong_to(:label) }

  it { is_expected.to have_many(:disbursements) }

  it { expect(build(:need)).to be_valid }
  it { expect(build(:need, :invalid)).not_to be_valid }
end
