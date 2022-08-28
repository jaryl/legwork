require 'rails_helper'

RSpec.describe Manage::DashboardController, type: :controller do
  let(:manager) { create(:manager) }

  before { sign_in(manager.profile.account) }

  describe "GET #show" do
    before { get :show }

    it { expect(response).to render_template(:show) }
  end
end
