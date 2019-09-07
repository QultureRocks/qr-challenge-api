# frozen_string_literal: true

module Core
  module Resolvers
    class UserResolver < GraphQL::Schema::Resolver
      argument :id, ID, required: true

      type ::Core::Types::UserType, null: true

      def resolve(id:)
        User.find_by(id: id)
      end
    end
  end
end
