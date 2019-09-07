# frozen_string_literal: true

class Types::HumanizedErrorType < Types::BaseObject
  graphql_name 'HumanizedErrorType'
  description 'A user-readable error'

  field :message, String, null: false, description: 'A description of the error'
  field :path, [String], null: true, description: 'Which input value this error came from'
end
