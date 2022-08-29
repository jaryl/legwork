require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do
  let(:admin) { create(:admin) }

  before { sign_in(admin.profile.account) }

  describe "GET #show" do
    before { get :show }

    it { expect(response).to render_template(:show) }
  end
end
