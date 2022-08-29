require 'rails_helper'

RSpec.describe My::DashboardController, type: :controller do
  let(:account) { create(:account) }
  let(:manager) { create(:profile, account: account, profileable: create(:manager)) }
  let(:coordinator) { create(:profile, account: account, profileable: create(:coordinator)) }

  let(:prepare_profiles) {}

  before do
    prepare_profiles
    sign_in(account)
    get :show
  end

  context "with no profiles" do
    it { expect(subject.current_account.profiles).to be_empty }
    it { is_expected.to render_template(:show) }
  end

  context "with manager profile only" do
    let(:prepare_profiles) { manager }

    it { expect(subject.current_account.profiles).to include(manager) }
    it { is_expected.to redirect_to(manage_root_path) }
  end

  context "with coordinator profile only" do
    let(:prepare_profiles) { coordinator }

    it { expect(subject.current_account.profiles).to include(coordinator) }
    it { is_expected.to redirect_to(coordinate_root_path) }
  end

  context "with manager and coordinator profiles" do
    let(:prepare_profiles) { manager; coordinator }

    it { expect(subject.current_account.profiles).to include(manager, coordinator) }
    it { is_expected.to redirect_to(manage_root_path) }
  end
end
