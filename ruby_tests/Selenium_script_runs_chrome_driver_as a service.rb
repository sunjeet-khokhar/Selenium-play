# filename: basic_Ruby_Selenium_template.rb
=begin
This script launches Chrome using the Chrome driver running as a service on a local port 
This saves creating and destroying the chrome driver instance in each test of your suite
For this script to work , the Chrome Driver exe needs to be launched first on a local port
then run the script 

=end

require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

def setup
  #@driver = Selenium::WebDriver.for :firefox
  @driver = Selenium::WebDriver.for :remote, url: 'http://localhost:9515', desired_capabilities: :chrome
end

def teardown
  @driver.quit
def

end run
  setup
  yield
  teardown
run


end do
  @driver.get 'http://admin:admin@the-internet.herokuapp.com/basic_auth'
  page_message = @driver.find_element(css: '.example p').text
  expect(page_message).to eql 'Congratulations! You must have the proper credentials.'
end