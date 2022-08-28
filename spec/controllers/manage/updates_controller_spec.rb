require 'rails_helper'

RSpec.describe Manage::UpdatesController, type: :controller do
  let(:campaign) { create(:campaign) }
  let(:update) { create(:update, campaign: campaign) }
  let(:manager) { create(:manager) }

  before { sign_in(manager.profile.account) }

  describe "GET #new" do
    before { get :new, params: { campaign_id: campaign } }

    it { expect(assigns(:update)).to be_new_record }
    it { expect(response).to render_template(:new) }
  end

  describe "POST #create" do
    before { post :create, params: { campaign_id: campaign, update: update_params } }

    context "with valid params" do
      let(:update_params) { attributes_for(:update) }

      it { expect(assigns(:update)).to be_persisted }
      it { expect(response).to redirect_to(manage_campaign_path(campaign)) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      let(:update_params) { attributes_for(:update, :invalid) }

      it { expect(assigns(:update)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe "GET #edit" do
    before { get :edit, params: { campaign_id: campaign, id: update } }

    it { expect(assigns(:update)).to eq(update) }
    it { expect(response).to render_template(:edit) }
  end

  describe "PUT #update" do
    before { put :update, params: { campaign_id: campaign, id: update, update: update_params } }

    context "with valid params" do
      let(:update_params) { attributes_for(:update) }

      it { expect(assigns(:update)).not_to be_changed }
      it { expect(response).to redirect_to(manage_campaign_path(campaign)) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      let(:update_params) { attributes_for(:update, :invalid) }

      it { expect(assigns(:update)).to be_changed }
      it { expect(response).to render_template(:edit) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe "DELETE #destroy" do
    before { delete :destroy, params: { campaign_id: campaign, id: update } }

    it { expect(assigns(:update)).to be_destroyed }
    it { expect(response).to redirect_to(manage_campaign_path(campaign)) }
    it { expect(response).to have_http_status(:see_other) }
  end
end
