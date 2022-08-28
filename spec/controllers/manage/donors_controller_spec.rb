require 'rails_helper'

RSpec.describe Manage::DonorsController, type: :controller do
  let(:donor) { create(:donor) }

  describe "GET #index" do
    before { donor; get :index }

    it { expect(assigns(:donors)).to be_present }
    it { expect(response).to render_template(:index) }
  end

  describe "GET #show" do
    before { get :show, params: { id: donor } }

    it { expect(assigns(:donor)).to eq(donor) }
    it { expect(response).to render_template(:show) }
  end
end
