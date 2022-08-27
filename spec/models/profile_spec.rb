require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { is_expected.to belong_to(:account) }
  it { is_expected.to belong_to(:profileable) }

  it { is_expected.to validate_presence_of(:display_name) }

  # TODO: uncomment when we have profileable
  # it { expect(build(:profile)).to be_valid }
  # it { expect(build(:profile, :invalid)).not_to be_valid }
end
