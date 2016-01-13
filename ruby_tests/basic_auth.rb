# filename: basic_Ruby_Selenium_template.rb
=begin
This is a bare bones Selenium test script, almost a template in Ruby
=end

require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers


def setup
  @driver = Selenium::WebDriver.for :firefox
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
  #the below statement will fail because there is no CSS element called pop
  # i delebirately did this to make my test fail and then make it pass!
  #page_message = @driver.find_element(css: 'pop').text
  page_message = @driver.find_element(css: 'p').text
  expect(page_message).to eql 'Congratulations!blah ... You must have the proper credentials.'
end
