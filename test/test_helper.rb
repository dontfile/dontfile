# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/mailers/'
  add_filter '/jobs/'
  add_filter '/channels/'
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def reset_max_file_size_constant(new_size = 0)
    Page.send(:remove_const, 'MAX_FILE_SIZE')
    Page.const_set('MAX_FILE_SIZE', new_size)
  end
end
