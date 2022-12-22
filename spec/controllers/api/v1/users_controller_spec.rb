# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:json) { JSON.parse(response.body).with_indifferent_access }
  let(:users_response) { json[:users] }
  let(:user_response) { json[:user] }

  before do
    get :index, as: :json
  end

  describe 'GET index' do
    let!(:users) { create_list(:user, 3) }

    before do
      get :index, as: :json
    end

    it 'responds with :ok status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns all users' do
      expect(users_response.map { |x| x[:id] }).to match_array(users.pluck(:id))
    end
  end

  describe 'GET show' do
    let(:user) { create(:user) }

    before do
      get :show, params: { id: user.id }, as: :json
    end

    it 'responds with :ok status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the user' do
      expect(user_response[:id]).to eq(user.id)
    end
  end

  describe 'POST create' do
    let(:user_params) { attributes_for(:user) }

    it 'responds with :ok status code' do
      post :create, params: { user: user_params }, as: :json
      expect(response).to have_http_status(:ok)
    end

    it 'creates an user' do
      expect { post :create, params: { user: user_params }, as: :json }.to change(User, :count).by(1)
    end
  end

  describe 'PUT update' do
    let(:new_name) { 'BoBoJackJack' }
    let(:user) { create(:user) }
    let(:update_attributes) { { name: new_name } }

    before do
      put :update, params: { user: update_attributes, id: user.id }, as: :json
    end

    it 'responds with :ok status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'updates the requested user' do
      expect(user_response[:id]).to eq(user.id)
      expect(user_response[:name]).to eq(new_name)
    end
  end

  describe 'DELETE destroy' do
    let!(:user) { create(:user) }

    it 'responds with :ok status code' do
      delete :destroy, params: { id: user.id }, as: :json
      expect(response).to have_http_status(:ok)
    end

    it 'feletes an user' do
      expect { delete :destroy, params: { id: user.id }, as: :json }.to change(User, :count).by(-1)
    end
  end
end
