require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers
require 'eyes_selenium'

Before do |scenario|
  @eyes = Applitools::Eyes.new
  @eyes.api_key = 'cCzNvtsrxlaKPcILHZqtNDnBHK3WLavd9t00LFPZQew110'
  caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer
  caps.version = '8'
  caps.platform = 'Windows XP'
  caps['name'] = scenario.title
  
  # if you want to use Sauce labs remote on demand Selenium testing service, 
  # i tried this before dont have credentials to log in , need to sign for a plan?
  #browser = Selenium::WebDriver.for(:remote,
   # url: "http://your-sauce-username:your-sauce-access-key@ondemand.saucelabs.com:80/wd/hub",
    #desired_capabilities: caps)
  
    #using a local instace of web driver rather than the remote one above as I dont yet 
    #have a SauceLabs account
    browser = Selenium::WebDriver.for :firefox
    @driver = @eyes.open(app_name: 'the-internet', test_name: scenario.title, driver: browser)
  end
  
 After do 
   @eyes.abort_if_not_closed
   @driver.quit
 end
  