require 'rails_helper'

RSpec.describe ContactMethod, type: :model do
  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to validate_presence_of(:value) }

  it { expect(build(:contact_method)).to be_valid }
  it { expect(build(:contact_method, :invalid)).not_to be_valid }
end
