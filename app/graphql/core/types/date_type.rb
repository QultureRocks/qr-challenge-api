# frozen_string_literal: true

module Core
  module Types
    class DateType < ::Types::BaseScalar
      graphql_name 'Date'

      def self.coerce_input(value, _ctx)
        Date.parse(value)
      end

      def self.coerce_result(value, _ctx)
        value.to_s
      end
    end
  end
end
