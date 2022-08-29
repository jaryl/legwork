require 'rails_helper'

RSpec.describe Admin::AccountsController, type: :controller do
  let(:account) { create(:account) }
  let(:admin) { create(:admin) }

  before { sign_in(admin.profile.account) }

  describe "GET #index" do
    before { get :index }

    it { expect(assigns(:accounts)).not_to be_empty }
    it { expect(response).to render_template(:index) }
  end

  describe "GET #show" do
    before { get :show, params: { id: account } }

    it { expect(assigns(:account)).to eq(account) }
    it { expect(response).to render_template(:show) }
  end
end
