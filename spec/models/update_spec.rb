require 'rails_helper'

RSpec.describe Update, type: :model do
  it { is_expected.to belong_to(:campaign) }
  it { is_expected.to belong_to(:manager) }

  it { is_expected.to validate_presence_of(:body) }

  it { expect(build(:update)).to be_valid }
  it { expect(build(:update, :invalid)).not_to be_valid }
end
