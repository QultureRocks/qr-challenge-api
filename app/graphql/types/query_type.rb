# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    extend GraphQR::QueryField
    extend GraphQR::RelationFields
  end
end
