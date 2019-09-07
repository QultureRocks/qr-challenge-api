# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    graphql_name 'Mutation'

    include Core::CoreMutations
  end
end
