=begin
An experimental ruby script where in I am learning how to use CSS selectors 
with Selenium
This script also shows use of an explicit wait  
=end

require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers

class CSS_sel_exp_class

  #Browser = 'firefox'
  URL = 'http://www.apple.com/itunes/?cid=OAS-US-DOMAINS-itunes.com'


def initialize(driver) 
  @driver = driver 
  @driver.get URL
  end

def wait_for_element()
   wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  #Use an explcit wait here to wait for the element to load, the hyperlink wont be opened without it !
  load = wait.until {@driver.find_element(css: 'a.more').displayed?}
end

def destroy()
  @driver.quit
end

def click_element()
# a.more is the "learn more"hyper link on itunes home page
    @driver.find_element(css: 'a.more').click
end



end