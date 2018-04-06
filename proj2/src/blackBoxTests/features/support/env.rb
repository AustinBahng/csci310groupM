
require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'selenium-webdriver'


# Capybara.register_driver :chrome do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome, :driver_path=>"/usr/lib/chromium-browser/chromedriver")
# end


# Capybara.default_driver = :chrome

require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium_chrome
  config.app_host = 'https://www.google.com' # change url
end