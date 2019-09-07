# frozen_string_literal: true

module Core
  module Mutations
    class CreateUserMutation < GraphQL::Schema::RelayClassicMutation
      argument :params, ::Core::Types::Inputs::CreateUserInput, required: true

      field :user, ::Core::Types::UserType, null: true
      field :errors, [::Types::HumanizedErrorType], null: false

      def resolve(params:)
        user = User.new(params.to_h)

        result = user.save

        {
          user: result ? user : nil,
          errors: user.errors.full_messages_and_paths
        }
      end
    end
  end
end
