require 'rails_helper'

RSpec.describe Manager, type: :model do
  it { is_expected.to have_one(:profile) }

  it { is_expected.to validate_presence_of(:contact_number) }

  it { expect(build(:manager)).to be_valid }
  it { expect(build(:manager, :invalid)).not_to be_valid }
end
