# frozen_string_literal: true

# Black-box browser tests. They talk to a running Dontfile server over HTTP
# and do not load the application, so they run against any version of it.
#
#   cd e2e && BASE_URL=http://localhost:3000 bundle exec ruby pages_test.rb

require "minitest/autorun"
require "capybara/minitest"
require "capybara/cuprite"
require "net/http"
require "securerandom"
require "json"
require "zip"

BASE_URL = ENV.fetch("BASE_URL", "http://localhost:3000")

Capybara.run_server = false
Capybara.app_host = BASE_URL
Capybara.default_max_wait_time = 5
Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(app, window_size: [1400, 1400], headless: ENV["HEADFUL"].nil?)
end
Capybara.default_driver = :cuprite

class E2ETest < Minitest::Test
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  FIXTURE = File.expand_path("fixtures/dontfile.png", __dir__)

  def teardown
    Capybara.reset_sessions!
  end

  def unique_path
    "e2e-#{SecureRandom.hex(4)}"
  end

  def http_get(path)
    Net::HTTP.get_response(URI.join(BASE_URL, path))
  end

  def text_area
    find_field(type: "textarea")
  end

  def type_text(text)
    text_area.send_keys(text)
  end
end
