# frozen_string_literal: true

module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :name, :email, :photo_url, :admission_date, :job_title, :created_at, :updated_at
    end
  end
end