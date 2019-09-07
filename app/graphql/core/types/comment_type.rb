# frozen_string_literal: true

module Core
  module Types
    class CommentType < ::Types::BaseObject
      graphql_name 'Comment'

      field :id, ID, null: false
      field :value, String, null: false, description: 'The actual commment made'
      field :created_at, Core::Types::TimeType, null: false
      field :updated_at, Core::Types::TimeType, null: false

      # RELATIONS
      field :user, Core::Types::UserType, null: false, description: 'The user that made the comment'
    end
  end
end
