require 'rails_helper'

RSpec.describe Coordinator, type: :model do
  it { is_expected.to have_one(:profile) }
  it { is_expected.to have_many(:pools) }

  it { expect(build(:coordinator)).to be_valid }
  it { expect(build(:coordinator, :invalid)).not_to be_valid }
end
