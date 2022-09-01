require 'rails_helper'

RSpec.describe Coordinate::ProfilesController, type: :controller do
  before { sign_in(account) }

  context "with no profile" do
    let(:account) { create(:account) }

    describe "GET #show" do
      before { get :show }

      it { expect(response).to redirect_to(my_root_path) }
      it { expect(response).to have_http_status(:see_other) }
    end

    describe "GET #new" do
      before { get :new }

      it { expect(assigns(:profile)).to be_new_record }
      it { expect(response).to render_template(:new) }
    end

    describe "POST #create" do
      before { post :create, params: { coordinator: coordinator_params } }

      context "with valid params" do
        let(:contact_methods_params) { { "0" => attributes_for(:contact_method) } }
        let(:profile_params) { attributes_for(:profile) }
        let(:coordinator_params) do
          attributes_for(:coordinator)
            .merge(contact_methods_attributes: contact_methods_params)
            .merge(profile_attributes: profile_params)
        end

        it { expect(assigns(:profile)).to be_persisted }
        it { expect(response).to redirect_to(coordinate_profile_path) }
        it { expect(response).to have_http_status(:see_other) }
      end

      context "with invalid params" do
        let(:profile_params) { attributes_for(:profile, :invalid) }
        let(:coordinator_params) { attributes_for(:coordinator, :invalid).merge(profile_attributes: profile_params) }

        it { expect(assigns(:profile)).not_to be_persisted }
        it { expect(response).to render_template(:new) }
        it { expect(response).to have_http_status(:unprocessable_entity) }
      end
    end

    describe "GET #edit" do
      before { get :edit }

      it { expect(response).to redirect_to(my_root_path) }
      it { expect(response).to have_http_status(:see_other) }
    end

    describe "PUT #update" do
      before { put :update }

      it { expect(response).to redirect_to(my_root_path) }
      it { expect(response).to have_http_status(:see_other) }
    end
  end

  context "with existing profile" do
    let(:coordinator) { create(:coordinator) }
    let(:account) { coordinator.profile.account }

    describe "GET #show" do
      before { get :show }

      it { expect(assigns(:profile)).to eq(coordinator) }
      it { expect(response).to render_template(:show) }
    end

    describe "GET #new" do
      before { get :new }

      it { expect(response).to redirect_to(coordinate_profile_path) }
      it { expect(response).to have_http_status(:see_other) }
    end

    describe "POST #create" do
      before { post :create }

      it { expect(response).to redirect_to(coordinate_profile_path) }
      it { expect(response).to have_http_status(:see_other) }
    end

    describe "GET #edit" do
      before { get :edit }

      it { expect(assigns(:profile)).to eq(coordinator) }
      it { expect(response).to render_template(:edit) }
    end

    describe "PUT #update" do
      before { put :update, params: { coordinator: coordinator_params } }

      context "with valid params" do
        let(:profile_params) { attributes_for(:profile) }
        let(:coordinator_params) { attributes_for(:coordinator).merge(profile_attributes: profile_params) }

        # TODO: JSONB column doesn't track changes, using Profile model instance instead
        it { expect(assigns(:profile).profile).not_to be_changed }
        it { expect(response).to redirect_to(coordinate_profile_path) }
        it { expect(response).to have_http_status(:see_other) }
      end

      context "with invalid params" do
        let(:profile_params) { attributes_for(:profile, :invalid) }
        let(:coordinator_params) { attributes_for(:coordinator, :invalid).merge(profile_attributes: profile_params) }

        it { expect(assigns(:profile).profile).to be_changed }
        it { expect(response).to render_template(:edit) }
        it { expect(response).to have_http_status(:unprocessable_entity) }
      end
    end
  end
end
