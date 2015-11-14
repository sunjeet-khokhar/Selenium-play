require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get "http://google.com"

puts "Web page title is #{driver.title}"

#element = driver.find_element(id: 'lst-ib')
element = driver.find_element :name => "q"
#element.send_keys('Cricket')
element.send_keys "Cricket"
element.submit

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until {driver.title.downcase.start_with? "cricket"}

puts "Page title is #{driver.title}"

driver.quit 



