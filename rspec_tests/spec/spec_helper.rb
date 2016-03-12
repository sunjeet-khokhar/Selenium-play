=begin
Packaging For Use

In order to get the most out of our tests and page objects, 
we'll need to package them into a more useful structure. 
Once that's done, we'll be able to add in the ability to run our tests against different browser 
and operating system combinations.

First we'll need to pull the test setup and teardown actions 
out of our tests and into a central place. 
In RSpec this is straight-forward through the use of a spec_helper file.
=end

require 'selenium-webdriver'

RSpec.configure do |config|
  
  config.before(:each) do
    @driver = Selenium::WebDriver.for :firefox
  end
  
  config.after(:each) do
    @driver.quit
  end
end
