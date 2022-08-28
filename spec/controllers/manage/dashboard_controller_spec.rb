require 'rails_helper'

RSpec.describe Manage::DashboardController, type: :controller do
  describe "GET #show" do
    before { get :show }

    it { expect(response).to render_template(:show) }
  end
end
