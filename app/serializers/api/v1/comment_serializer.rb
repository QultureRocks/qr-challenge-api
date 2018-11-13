# frozen_string_literal: true

module Api
  module V1
    class CommentSerializer < ActiveModel::Serializer
      attributes :id, :value, :created_at, :updated_at

      has_one :user
    end
  end
end
