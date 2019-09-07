# frozen_string_literal: true

module CoreExtensions
  module ActiveModel
    module Errors
      def full_messages_and_paths(custom_path = [])
        map do |attribute, message|
          path = ['attributes', *custom_path, attribute.to_s.camelize(:lower)]
          {
            message: full_message(attribute, message),
            path: path
          }
        end
      end
    end
  end
end
