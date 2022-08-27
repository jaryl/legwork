require 'rails_helper'

RSpec.describe Donor, type: :model do
  it { is_expected.to have_many(:donations) }

  it { is_expected.to validate_presence_of(:name) }
end
