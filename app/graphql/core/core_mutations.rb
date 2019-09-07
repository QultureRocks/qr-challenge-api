# frozen_string_literal: true

module Core
  module CoreMutations
    extend ActiveSupport::Concern

    included do
      # User
      field :delete_user, mutation: ::Core::Mutations::DeleteUserMutation
      field :create_user, mutation:  ::Core::Mutations::CreateUserMutation
      field :update_user, mutation:  ::Core::Mutations::UpdateUserMutation

      # Comment
      field :delete_comment, mutation: ::Core::Mutations::DeleteCommentMutation
      field :create_comment, mutation:  ::Core::Mutations::CreateCommentMutation
      field :update_comment, mutation:  ::Core::Mutations::UpdateCommentMutation
    end
  end
end
