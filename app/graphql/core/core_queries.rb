# frozen_string_literal: true

module Core
  module CoreQueries
    extend ActiveSupport::Concern

    included do
      # User
      field :user, resolver: ::Core::Resolvers::UserResolver
      field :users, resolver:  ::Core::Resolvers::UsersResolver

      # Comment
      field :comment, resolver: ::Core::Resolvers::CommentResolver
      field :comments, resolver:  ::Core::Resolvers::CommentsResolver
    end
  end
end
