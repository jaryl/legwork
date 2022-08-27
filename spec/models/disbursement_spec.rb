require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  it { is_expected.to have_one(:transaction_record) }
  it { is_expected.to belong_to(:need) }

  it { expect(build(:disbursement)).to be_valid }
  it { expect(build(:disbursement, :invalid)).not_to be_valid }
end
