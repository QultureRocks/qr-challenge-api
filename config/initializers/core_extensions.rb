# frozen_string_literal: true

require_relative '../../lib/core_extensions/active_model/errors'

ActiveModel::Errors.include CoreExtensions::ActiveModel::Errors
