require 'rails_helper'

RSpec.describe Coordinate::PoolsController, type: :controller do
  let(:coordinator) { create(:coordinator) }

  before { sign_in(coordinator.profile.account) }

  context "with active pool" do
    before { create(:pool, handler: coordinator) }

    describe "GET #show" do
      before { get :show }

      it { expect(assigns(:pool)).to be_present }
      it { expect(response).to render_template(:show) }
    end

    describe "GET #new" do
      before { get :new }

      it { expect(response).to redirect_to(coordinate_pool_path) }
      it { expect(response).to have_http_status(:see_other) }
    end

    describe "POST #create" do
      before { post :create }

      it { expect(response).to redirect_to(coordinate_pool_path) }
      it { expect(response).to have_http_status(:see_other) }
    end

    describe "DELETE #destroy" do
      before { delete :destroy }

      it { expect(assigns(:pool)).to be_destroyed }
      it { expect(response).to redirect_to(new_coordinate_pool_path) }
      it { expect(response).to have_http_status(:see_other) }
    end
  end

  context "with no active pool" do
    describe "GET #show" do
      before { get :show }

      it { expect(response).to redirect_to(new_coordinate_pool_path) }
      it { expect(response).to have_http_status(:see_other) }
    end

    describe "GET #new" do
      before { get :new }

      it { expect(assigns(:pool)).to be_new_record }
      it { expect(response).to render_template(:new) }
    end

    describe "POST #create" do
      before { post :create, params: { pool: pool_params } }

      context "with valid params" do
        let(:pool_params) { attributes_for(:pool) }

        it { expect(assigns(:pool)).to be_persisted }
        it { expect(response).to redirect_to(coordinate_pool_path) }
        it { expect(response).to have_http_status(:see_other) }
      end

      context "with invalid params" do
        let(:pool_params) { attributes_for(:pool, :invalid) }

        it { expect(assigns(:pool)).not_to be_persisted }
        it { expect(response).to render_template(:new) }
        it { expect(response).to have_http_status(:unprocessable_entity) }
      end
    end

    describe "DELETE #destroy" do
      before { delete :destroy }

      it { expect(response).to redirect_to(new_coordinate_pool_path) }
      it { expect(response).to have_http_status(:see_other) }
    end
  end
end
