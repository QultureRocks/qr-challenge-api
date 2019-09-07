# frozen_string_literal: true

module Core
  module Types
    module Inputs
      class UpdateCommentInput < ::Types::BaseInputObject
        argument :value, String, required: true
      end
    end
  end
end
