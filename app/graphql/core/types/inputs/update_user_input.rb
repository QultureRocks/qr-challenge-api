# frozen_string_literal: true

module Core
  module Types
    module Inputs
      class UpdateUserInput < ::Types::BaseInputObject
        argument :admission_date, Core::Types::DateType, required: false
        argument :email, String, required: false
        argument :job_title, String, required: false
        argument :name, String, required: false
        argument :photo_url, String, required: false
      end
    end
  end
end
