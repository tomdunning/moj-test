require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

# Protect the DBs
abort('Must be run in test') unless Rails.env.test?

require 'rspec/rails'
