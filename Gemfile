# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.7'

gem 'active_model_serializers'
gem 'apipie-rails'
gem 'bootsnap'
gem 'faker'
gem 'graphiql-rails'
gem 'graphql'
gem 'pg'
gem 'puma'
gem 'rack-cors', require: 'rack/cors'
gem 'rails'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'shoulda-matchers'
end

group :development do
  gem 'annotate'
  gem 'spring', '~> 4.1' # https://stackoverflow.com/questions/70849954/undefined-method-mechanism-for-activesupportdependenciesmodule-nomethoder
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
