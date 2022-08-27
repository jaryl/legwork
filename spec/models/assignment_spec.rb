require 'rails_helper'

RSpec.describe Assignment, type: :model do
  it { is_expected.to belong_to(:case) }
  it { is_expected.to belong_to(:manager) }

  it { expect(build(:assignment)).to be_valid }
  it { expect(build(:assignment, :invalid)).not_to be_valid }
end
