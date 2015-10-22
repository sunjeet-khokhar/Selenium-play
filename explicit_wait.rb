require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get "http://www.ted.com"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
ELEMENT = "div.home-main.main"
begin
  
    #found = driver.find_element(:css => "div.home-main.main")
    #element =
     # wait.until {driver.find_element(:css => "div.home-main.main")}
     #wait.until {driver.find_element(:css => "div.home-main.main")}
     found = driver.find_element(:css,ELEMENT).displayed?
     wait.until {driver.find_element(:css,ELEMENT).displayed?}
     if
       found == true
       puts "found!"
     else
       puts "not found!"
     end 

    
ensure
  driver.quit
end




