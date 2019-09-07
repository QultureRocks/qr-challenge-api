# frozen_string_literal: true

module Core
  module Mutations
    class UpdateCommentMutation < GraphQL::Schema::RelayClassicMutation
      argument :id, ID, required: true
      argument :params, ::Core::Types::Inputs::UpdateCommentInput, required: true

      field :comment, ::Core::Types::CommentType, null: true
      field :errors, [::Types::HumanizedErrorType], null: false

      def resolve(id:, params:)
        comment = Comment.find(id)
        comment.assign_attributes(params.to_h)

        result = comment.save

        {
          comment: result ? comment : nil,
          errors: comment.errors.full_messages_and_paths
        }
      end
    end
  end
end
