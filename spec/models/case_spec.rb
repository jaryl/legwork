require 'rails_helper'

RSpec.describe Case, type: :model do
  it { is_expected.to belong_to(:beneficiary) }

  it { is_expected.to validate_presence_of(:nature) }

  it { expect(build(:case)).to be_valid }
  it { expect(build(:case, :invalid)).not_to be_valid }
end