# frozen_string_literal: true

module Core
  module Resolvers
    class CommentResolver < GraphQL::Schema::Resolver
      argument :id, ID, required: true

      type ::Core::Types::CommentType, null: true

      def resolve(id:)
        Comment.find_by(id: id)
      end
    end
  end
end
