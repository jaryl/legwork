require 'rails_helper'

RSpec.describe Manage::DisbursementsController, type: :controller do
  let(:pool) { create(:pool) }

  describe "GET #new" do
    before { get :new, params: { pool_id: pool } }

    it { expect(assigns(:disbursement)).to be_new_record }
    it { expect(response).to render_template(:new) }
  end

  describe "POST #create" do
    let(:disbursement_params) { { transaction_record_attributes: transaction_record_params } }

    before { create(:need) }
    before { post :create, params: { pool_id: pool, disbursement: disbursement_params } }

    context "with valid params" do
      let(:transaction_record_params) { attributes_for(:transaction_record) }

      it { expect(assigns(:disbursement)).to be_persisted }
      it { expect(response).to redirect_to(manage_pool_path(pool)) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      let(:transaction_record_params) { attributes_for(:transaction_record, :invalid) }

      it { expect(assigns(:disbursement)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end
end
