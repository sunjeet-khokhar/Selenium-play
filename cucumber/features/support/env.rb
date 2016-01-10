require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers
require 'eyes_selenium'

Before do |scenario|
  @eyes = Applitools::Eyes.new
  @eyes.api_key = 'your Applitools API key'
  caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer
  caps.version = '8'
  caps.platform = 'Windows XP'
  caps['name'] = scenario.title
  browser = Selenium::WebDriver.for(:remote,
    url: "http://your-sauce-username:your-sauce-access-key@ondemand.saucelabs.com:80/wd/hub",
    desired_capabilities: caps)
    @driver = @eyes.open(app_name: 'the-internet', test_name: scenario.title, driver: browser)
  end
  
 After do 
   @eyes.abort_if_not_closed
   @driver.quit
 end
  