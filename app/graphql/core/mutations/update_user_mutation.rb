# frozen_string_literal: true

module Core
  module Mutations
    class UpdateUserMutation < GraphQL::Schema::RelayClassicMutation
      argument :id, ID, required: true
      argument :params, ::Core::Types::Inputs::UpdateUserInput, required: true

      field :user, ::Core::Types::UserType, null: true
      field :errors, [::Types::HumanizedErrorType], null: false

      def resolve(id:, params:)
        user = User.find(id)
        user.assign_attributes(params.to_h)

        result = user.save

        {
          user: result ? user : nil,
          errors: user.errors.full_messages_and_paths
        }
      end
    end
  end
end
