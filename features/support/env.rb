# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'os'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = 'http://automationpractice.com/index.php'
  config.default_max_wait_time = 5
end
