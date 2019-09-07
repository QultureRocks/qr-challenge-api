# frozen_string_literal: true

module Core
  module Types
    module Scopes
      class UserScope < ::Types::BaseInputObject
        argument :order_by_name, Boolean, required: false
      end
    end
  end
end
