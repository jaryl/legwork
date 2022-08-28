require 'rails_helper'

RSpec.describe Manage::PoolsController, type: :controller do
  let(:pool) { create(:pool) }
  let(:manager) { create(:manager) }

  before { sign_in(manager.profile.account) }

  describe "GET #index" do
    before { pool; get :index }

    it { expect(assigns(:pools)).to be_present }
    it { expect(response).to render_template(:index) }
  end

  describe "GET #show" do
    before { get :show, params: { id: pool } }

    it { expect(assigns(:pool)).to eq(pool) }
    it { expect(response).to render_template(:show) }
  end
end
