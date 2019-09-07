# frozen_string_literal: true

module Core
  module Resolvers
    class UsersResolver < GraphQL::Schema::Resolver
      argument :filter, ::Core::Types::Scopes::UserScope, required: false

      type [::Core::Types::UserType], null: false

      def resolve(filter: {})
        if filter[:order_by_name]
          User.order_by_name
        else
          User.all
        end
      end
    end
  end
end
