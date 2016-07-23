# filename: basic_Ruby_Selenium_template.rb
=begin
This is a bare bones Selenium test script, almost a template in Ruby
=end

require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  @driver = Selenium::WebDriver.for :firefox	
  #@driver = Selenium::WebDriver.for , url: 'http://the-internet.herokuapp.com/javascript_alerts', desired_capabilities: :chrome
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
  @driver.get 'http://the-internet.herokuapp.com/javascript_alerts'
  @driver.find_elements(tag_name: 'button')[1].click

  
  #expect(page_message).to eql 'Congratulations! You must have the proper credentials.'
  
end