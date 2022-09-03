require 'rails_helper'

RSpec.describe Admin::LabelsController, type: :controller do
  let(:admin) { create(:admin) }
  let(:label) { create(:label) }

  before { sign_in(admin.profile.account) }

  describe "GET #index" do
    before { label; get :index }

    it { expect(assigns(:labels)).to be_present }
    it { expect(response).to render_template(:index) }
  end

  describe "GET #new" do
    before { get :new }

    it { expect(assigns(:label)).to be_new_record }
    it { expect(response).to render_template(:new) }
  end

  describe "POST #create" do
    before { post :create, params: { label: label_params } }

    context "with valid params" do
      let(:label_params) { attributes_for(:label) }

      it { expect(assigns(:label)).to be_persisted }
      it { expect(response).to redirect_to(admin_labels_path) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      let(:label_params) { attributes_for(:label, :invalid) }

      it { expect(assigns(:label)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe "GET #edit" do
    before { get :edit, params: { id: label } }

    it { expect(assigns(:label)).to eq(label) }
    it { expect(response).to render_template(:edit) }
  end

  describe "PUT #update" do
    before { put :update, params: { id: label, label: label_params } }

    context "with valid params" do
      let(:label_params) { attributes_for(:label) }

      it { expect(assigns(:label)).not_to be_changed }
      it { expect(response).to redirect_to(admin_labels_path) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      let(:label_params) { attributes_for(:label, :invalid) }

      it { expect(assigns(:label)).to be_changed }
      it { expect(response).to render_template(:edit) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe "DELETE #destroy" do
    before { delete :destroy, params: { id: label } }

    it { expect(assigns(:label)).to be_destroyed }
    it { expect(response).to redirect_to(admin_labels_path) }
  end
end
