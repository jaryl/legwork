require 'rails_helper'

RSpec.describe Admin, type: :model do
  it { is_expected.to have_one(:profile) }

  it { expect(build(:admin)).to be_valid }
  it { expect(build(:admin, :invalid)).not_to be_valid }
end
