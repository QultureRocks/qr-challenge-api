# frozen_string_literal: true

module Core
  module Mutations
    class CreateCommentMutation < GraphQL::Schema::RelayClassicMutation
      argument :params, ::Core::Types::Inputs::CreateCommentInput, required: true

      field :comment, ::Core::Types::CommentType, null: true
      field :errors, [::Types::HumanizedErrorType], null: false

      def resolve(params:)
        comment = Comment.new(params.to_h)

        result = comment.save

        {
          comment: result ? comment : nil,
          errors: comment.errors.full_messages_and_paths
        }
      end
    end
  end
end
