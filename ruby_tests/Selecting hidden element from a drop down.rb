# filename: basic_Ruby_Selenium_template.rb
=begin
Open a browser
Visit the page
Grab all dropdown list elements and find the one we want by it's text
Assert that the element is not enabled
Close the browser
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
  @driver.get 'http://the-internet.herokuapp.com/dropdown'
  Drop_down_options = @driver.find_elements(tag_name: 'option')
  puts Drop_down_options
  item_of_interest = Drop_down_options.find { |dropdown| dropdown.text == 'Please select an option'}
  #expect(disabled_element.enabled?).to eql false
  expect(item_of_interest.enabled?).to eql false
end