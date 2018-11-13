# frozen_string_literal: true

Apipie.configure do |config|
  config.use_cache = true
  config.translate = false
  config.app_name                = 'Qulture.Rocks Challenge API'
  config.api_base_url            = '/api'
  config.doc_base_url            = '/apipie'
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
