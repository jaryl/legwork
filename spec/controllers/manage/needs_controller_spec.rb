require 'rails_helper'

RSpec.describe Manage::NeedsController, type: :controller do
  let(:beneficiary) { create(:beneficiary) }
  let(:need) { create(:need, beneficiary: beneficiary) }
  let(:manager) { create(:manager) }

  before { sign_in(manager.profile.account) }

  describe "GET #new" do
    before { get :new, params: { beneficiary_id: beneficiary } }

    it { expect(assigns(:need)).to be_new_record }
    it { expect(response).to render_template(:new) }
  end

  describe "POST #create" do
    before { post :create, params: { beneficiary_id: beneficiary, need: need_params } }

    context "with valid params" do
      let(:need_params) { attributes_for(:need) }

      it { expect(assigns(:need)).to be_persisted }
      it { expect(response).to redirect_to(manage_beneficiary_path(beneficiary)) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      let(:need_params) { attributes_for(:need, :invalid) }

      it { expect(assigns(:need)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe "GET #edit" do
    before { get :edit, params: { beneficiary_id: beneficiary, id: need } }

    it { expect(assigns(:need)).to be_present }
    it { expect(response).to render_template(:edit) }
  end

  describe "PUT #update" do
    before { put :update, params: { beneficiary_id: beneficiary, id: need, need: need_params } }

    context "with valid params" do
      let(:need_params) { attributes_for(:need) }

      it { expect(assigns(:need)).not_to be_changed }
      it { expect(response).to redirect_to(manage_beneficiary_path(beneficiary)) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      let(:need_params) { attributes_for(:need, :invalid) }

      it { expect(assigns(:need)).to be_changed }
      it { expect(response).to render_template(:edit) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end
end
