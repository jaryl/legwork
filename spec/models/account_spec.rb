require 'rails_helper'

RSpec.describe Account, type: :model do
  it { is_expected.to have_many(:profiles) }

  it { is_expected.to validate_presence_of(:email) }

  it { expect(build(:account)).to be_valid }
  it { expect(build(:account, :invalid)).not_to be_valid }
end
