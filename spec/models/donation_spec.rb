require 'rails_helper'

RSpec.describe Donation, type: :model do
  it { is_expected.to have_one(:transaction_record) }
  it { is_expected.to belong_to(:donor) }

  it { expect(build(:donation)).to be_valid }
  it { expect(build(:donation, :invalid)).not_to be_valid }
end
