require 'rails_helper'

RSpec.describe Manage::BeneficiariesController, type: :controller do
  let(:beneficiary) { create(:beneficiary) }
  let(:manager) { create(:manager) }

  before { sign_in(manager.profile.account) }

  describe "GET #index" do
    before { beneficiary; get :index }

    it { expect(assigns(:beneficiaries)).to be_present }
    it { expect(response).to render_template(:index) }
  end

  describe "GET #show" do
    before { get :show, params: { id: beneficiary } }

    it { expect(assigns(:beneficiary)).to eq(beneficiary) }
    it { expect(response).to render_template(:show) }
  end

  describe "GET #new" do
    before { get :new }

    it { expect(assigns(:beneficiary)).to be_new_record }
    it { expect(response).to render_template(:new) }
  end

  describe "POST #create" do
    before { post :create, params: { beneficiary: beneficiary_params } }

    context "with valid params" do
      let(:beneficiary_params) { attributes_for(:beneficiary) }

      it { expect(assigns(:beneficiary)).to be_persisted }
      it { expect(response).to redirect_to(manage_beneficiaries_path) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      let(:beneficiary_params) { attributes_for(:beneficiary, :invalid) }

      it { expect(assigns(:beneficiary)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe "GET #edit" do
    before { get :edit, params: { id: beneficiary } }

    it { expect(assigns(:beneficiary)).to be_present }
    it { expect(response).to render_template(:edit) }
  end

  describe "PUT #update" do
    before { put :update, params: { id: beneficiary, beneficiary: beneficiary_params } }

    context "with valid params" do
      let(:beneficiary_params) { attributes_for(:beneficiary) }

      it { expect(assigns(:beneficiary)).not_to be_changed }
      it { expect(response).to redirect_to(manage_beneficiary_path(beneficiary)) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      let(:beneficiary_params) { attributes_for(:beneficiary, :invalid) }

      it { expect(assigns(:beneficiary)).to be_changed }
      it { expect(response).to render_template(:edit) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end
end
