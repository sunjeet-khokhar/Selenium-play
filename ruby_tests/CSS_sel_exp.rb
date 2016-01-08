=begin
An experimental ruby script where in I am learning how to use CSS selectors 
with Selenium
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
  #teardown
end

run do
  #@driver.get 'http://auburn.craigslist.org/'
  
  #click the farm and garden link , using the link's css id 
  #@driver.find_element(css: 'a.gra').click
  
  #click the antiques link
  #@driver.find_element(css: 'a.ata').click

  @driver.get 'http://www.apple.com/itunes/?cid=OAS-US-DOMAINS-itunes.com'
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  #Use an explcit wait here to wait for the element to load
  load = wait.until {@driver.find_element(css: 'a.more').displayed?}
  if load == true
    # a.more is the "learn more"hyper link on itunes home page
    @driver.find_element(css: 'a.more').click
  else
   puts 'element not found'
  end


end
