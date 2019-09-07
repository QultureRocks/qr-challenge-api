# frozen_string_literal: true

module Core
  module Mutations
    class DeleteCommentMutation < GraphQL::Schema::RelayClassicMutation
      argument :id, ID, required: true

      field :id, ID, null: false
      field :errors, [::Types::HumanizedErrorType], null: false

      def resolve(id:)
        comment = Comment.find(id)

        comment.destroy

        {
          id: comment.id,
          errors: comment.errors.full_messages_and_paths
        }
      end
    end
  end
end
