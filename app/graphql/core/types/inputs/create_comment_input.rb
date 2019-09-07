# frozen_string_literal: true

module Core
  module Types
    module Inputs
      class CreateCommentInput < ::Types::BaseInputObject
        argument :user_id, ID, required: true
        argument :value, String, required: true
      end
    end
  end
end
