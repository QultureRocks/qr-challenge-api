# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do
  let(:json) { JSON.parse(response.body).with_indifferent_access }
  let(:comments_response) { json[:comments] }
  let(:comment_response) { json[:comment] }

  describe 'GET index' do
    let(:user) { create(:user) }
    let!(:comments) { create_list(:comment, 3, user: user) }
    let!(:other_comments) { create_list(:comment, 2) }

    before do
      get :index, params: { user_id: user.id }, as: :json
    end

    it 'responds with :ok status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns all comments from user' do
      expect(comments_response.map{|x| x[:id] }).to match_array(comments.pluck(:id))
    end
  end

  describe 'GET show' do
    let(:comment) { create(:comment) }

    before do
      get :show, params: { id: comment.id },  as: :json
    end

    it 'responds with :ok status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the comment' do
      expect(comment_response[:id]).to eq(comment.id)
    end
  end

  describe 'POST create' do
    let(:user) { create(:user) }
    let(:comment_params) { attributes_for(:comment, user_id: user.id) }

    it 'responds with :ok status code' do
      post :create, params: { comment: comment_params }, as: :json
      expect(response).to have_http_status(:ok)
    end

    it 'creates a comment' do
      expect{ post :create, params: { comment: comment_params }, as: :json }.to change(Comment, :count).by(1)
    end
  end

  describe 'PUT update' do
    let(:new_value) { 'new comment' }
    let(:comment) { create(:comment) }
    let(:update_attributes) { { value: new_value } }

    before do
      put :update, params: { comment: update_attributes, id: comment.id }, as: :json
    end

    it 'responds with :ok status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'updates the requested comment' do
      expect(comment_response[:id]).to eq(comment.id)
      expect(comment_response[:value]).to eq(new_value)
    end
  end

  describe 'DELETE destroy' do
    let!(:comment) { create(:comment) }

    it 'responds with :ok status code' do
      delete :destroy, params: { id: comment.id }, as: :json
      expect(response).to have_http_status(:ok)
    end

    it 'deletes a comment' do
      expect{ delete :destroy, params: { id: comment.id }, as: :json }.to change(Comment, :count).by(-1)
    end
  end
end