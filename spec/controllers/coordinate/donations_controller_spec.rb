require 'rails_helper'

RSpec.describe Coordinate::DonationsController, type: :controller do
  let(:coordinator) { create(:coordinator) }

  before { sign_in(coordinator.profile.account) }

  context "with active pool" do
    let(:pool) { create(:pool, :active, handler: coordinator) }
    let(:transaction_record) { create(:transaction_record, pool: pool, transactable: create(:donation)) }
    let(:donation) { transaction_record.transactable }

    before { pool }

    describe "GET #index" do
      before { transaction_record; get :index }

      it { expect(assigns(:donations)).to be_present }
      it { expect(response).to render_template(:index) }
    end

    describe "GET #show" do
      before { get :show, params: { id: transaction_record } }

      it { expect(assigns(:donation)).to eq(transaction_record) }
      it { expect(response).to render_template(:show) }
    end

    describe "GET #new" do
      before { get :new }

      it { expect(assigns(:donation)).to be_new_record }
      it { expect(response).to render_template(:new) }
    end

    describe "POST #create" do
      before { post :create, params: { donation: donation_params } }

      context "with valid params" do
        let(:donation_params) { attributes_for(:transaction_record) }

        it { expect(assigns(:donation)).to be_persisted }
        it { expect(response).to redirect_to(coordinate_donation_path(assigns(:donation))) }
        it { expect(response).to have_http_status(:see_other) }
      end

      context "with invalid params" do
        let(:donation_params) { attributes_for(:transaction_record, :invalid) }

        it { expect(assigns(:donation)).not_to be_persisted }
        it { expect(response).to render_template(:new) }
        it { expect(response).to have_http_status(:unprocessable_entity) }
      end
    end
  end

  context "with no active pool" do
    describe "GET #index" do
      before { get :index }

      it { expect(response).to redirect_to(new_coordinate_pool_path) }
      it { expect(response).to have_http_status(:see_other) }
    end

    describe "GET #show" do
      before { get :show, params: { id: SecureRandom.uuid } }

      it { expect(response).to redirect_to(new_coordinate_pool_path) }
      it { expect(response).to have_http_status(:see_other) }
    end

    describe "GET #new" do
      before { get :new }

      it { expect(response).to redirect_to(new_coordinate_pool_path) }
      it { expect(response).to have_http_status(:see_other) }
    end
  end
end
