# frozen_string_literal: true

module Core
  module Mutations
    class DeleteUserMutation < GraphQL::Schema::RelayClassicMutation
      argument :id, ID, required: true

      field :id, ID, null: false
      field :errors, [::Types::HumanizedErrorType], null: false

      def resolve(id:)
        user = User.find(id)

        user.destroy

        {
          id: user.id,
          errors: user.errors.full_messages_and_paths
        }
      end
    end
  end
end
