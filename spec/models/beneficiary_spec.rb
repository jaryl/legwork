require 'rails_helper'

RSpec.describe Beneficiary, type: :model do
  it { is_expected.to have_many(:needs) }

  it { is_expected.to validate_presence_of(:full_name) }

  it { expect(build(:beneficiary)).to be_valid }
  it { expect(build(:beneficiary, :invalid)).not_to be_valid }
end
