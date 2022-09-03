require 'rails_helper'

RSpec.describe Label, type: :model do
  it { is_expected.to have_many(:needs) }

  it { is_expected.to validate_presence_of(:name) }

  it { expect(build(:label)).to be_valid }
  it { expect(build(:label, :invalid)).not_to be_valid }
end
