require 'rails_helper'

RSpec.describe Manage::CampaignsController, type: :controller do
  let(:campaign) { create(:campaign) }

  describe "GET #index" do
    before { campaign; get :index }

    it { expect(assigns(:campaigns)).to be_present }
    it { expect(response).to render_template(:index) }
  end

  describe "GET #show" do
    before { get :show, params: { id: campaign } }

    it { expect(assigns(:campaign)).to eq(campaign) }
    it { expect(response).to render_template(:show) }
  end

  describe "GET #new" do
    before { get :new }

    it { expect(assigns(:campaign)).to be_new_record }
    it { expect(response).to render_template(:new) }
  end

  describe "POST #create" do
    let(:need) { create(:need) }
    let(:pool) { create(:pool) }

    before { post :create, params: { campaign: campaign_params } }

    context "with valid params" do
      let(:associated_params) { { need_id: need, pool_id: pool } }
      let(:campaign_params) { attributes_for(:campaign).merge(associated_params) }

      it { expect(assigns(:campaign)).to be_persisted }
      it { expect(response).to redirect_to(manage_campaign_path(assigns(:campaign))) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      let(:campaign_params) { attributes_for(:campaign, :invalid) }

      it { expect(assigns(:campaign)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe "GET #edit" do
    before { get :edit, params: { id: campaign } }

    it { expect(assigns(:campaign)).to be_present }
    it { expect(response).to render_template(:edit) }
  end

  describe "PUT #update" do
    before { put :update, params: { id: campaign, campaign: campaign_params } }

    context "with valid params" do
      let(:campaign_params) { attributes_for(:campaign) }

      it { expect(assigns(:campaign)).not_to be_changed }
      it { expect(response).to redirect_to(manage_campaign_path(assigns(:campaign))) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      let(:campaign_params) { attributes_for(:campaign, :invalid) }

      it { expect(assigns(:campaign)).to be_changed }
      it { expect(response).to render_template(:edit) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end
end
