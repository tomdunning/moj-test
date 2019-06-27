require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

# Protect the DBs
abort('Must be run in test') unless Rails.env.test?

require 'rspec/rails'

Dir[Rails.root.join('spec/support/*.rb')].each { |file| require file }

RSpec.configure do |config|
  config.include DictionaryHelpers
  config.use_transactional_fixtures = true
end
