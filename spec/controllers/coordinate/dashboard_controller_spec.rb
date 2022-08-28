require 'rails_helper'

RSpec.describe Coordinate::DashboardController, type: :controller do
  let(:coordinator) { create(:coordinator) }

  before { sign_in(coordinator.profile.account) }

  describe "GET #show" do
    before { get :show }

    it { expect(response).to render_template(:show) }
  end
end
