# frozen_string_literal: true

module Core
  module Types
    module Scopes
      class CommentScope < ::Types::BaseInputObject

        argument :order_by_created_at, Boolean, required: false
      end
    end
  end
end
