# frozen_string_literal: true

module Core
  module Resolvers
    class CommentsResolver < GraphQL::Schema::Resolver
      argument :filter, ::Core::Types::Scopes::CommentScope, required: false

      type [::Core::Types::CommentType], null: false

      def resolve(filter: {})
        if filter[:order_by_created_at]
          Comment.order_by_created_at
        else
          Comment.all
        end
      end
    end
  end
end
