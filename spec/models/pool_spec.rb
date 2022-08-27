require 'rails_helper'

RSpec.describe Pool, type: :model do
  it { is_expected.to belong_to(:handler) }
  it { is_expected.to have_many(:transactions) }

  it { is_expected.to validate_presence_of(:name) }

  it { expect(build(:pool)).to be_valid }
  it { expect(build(:pool, :invalid)).not_to be_valid }
end
