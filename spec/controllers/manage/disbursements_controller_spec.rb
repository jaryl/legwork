require 'rails_helper'

RSpec.describe Manage::DisbursementsController, type: :controller do
  let(:pool) { create(:pool) }
  let(:manager) { create(:manager) }

  before { sign_in(manager.profile.account) }

  describe "GET #new" do
    before { get :new, params: { pool_id: pool } }

    it { expect(assigns(:disbursement)).to be_new_record }
    it { expect(response).to render_template(:new) }
  end

  describe "POST #create" do
    before { create(:need) }
    before { post :create, params: { pool_id: pool, disbursement: disbursement_params } }

    context "with valid params" do
      let(:disbursement_params) { attributes_for(:transaction_record) }

      it { expect(assigns(:disbursement)).to be_persisted }
      it { expect(assigns(:disbursement).errors).to be_empty }
      it { expect(response).to redirect_to(manage_pool_path(pool)) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      let(:disbursement_params) { attributes_for(:transaction_record, :invalid) }

      it { expect(assigns(:disbursement)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end
end
