# frozen_string_literal: true

module Core
  module Types
    module Inputs
      class CreateUserInput < ::Types::BaseInputObject
        argument :admission_date, Core::Types::DateType, required: true
        argument :email, String, required: true
        argument :job_title, String, required: true
        argument :name, String, required: true
        argument :photo_url, String, required: false
      end
    end
  end
end
