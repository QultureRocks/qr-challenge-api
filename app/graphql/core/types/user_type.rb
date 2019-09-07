# frozen_string_literal: true

module Core
  module Types
    class UserType < ::Types::BaseObject
      graphql_name 'User'

      field :id, ID, null: false
      field :admission_date, Core::Types::DateType, null: false
      field :email, String, null: false
      field :job_title, String, null: false
      field :name, String, null: false
      field :photo_url, String, null: true
      field :created_at, Core::Types::TimeType, null: false
      field :updated_at, Core::Types::TimeType, null: false

      # RELATIONS
      field :comments, [Core::Types::CommentType], null: false, description: 'The comments made by the user'
    end
  end
end
