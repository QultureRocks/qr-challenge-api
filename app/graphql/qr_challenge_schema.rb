# frozen_string_literal: true

class QrChallengeSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
