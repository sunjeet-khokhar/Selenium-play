# filename: basic_Ruby_Selenium_template.rb
=begin
This is a bare bones Selenium test script, almost a template in Ruby
=end

require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  @driver = Selenium::WebDriver.for :firefox
  #@driver = Selenium::WebDriver.for :remote, url: 'http://localhost:9515', desired_capabilities: :chrome
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end


run do
  @driver.get 'http://admin:admin@the-internet.herokuapp.com/basic_auth'
  page_message = @driver.find_element(css: '.example p').text
  expect(page_message).to eql 'Congratulations! You must have the proper credentials.'
end