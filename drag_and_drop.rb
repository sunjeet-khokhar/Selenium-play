 require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get "https://www.tumblr.com/dashboard"

source = driver.find_element(:css, 'i.icon_post_chat')
target = driver.find_element(:name, 'form_key')

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until {driver.action.drag_and_drop(source, target).perform}

# puts "Web page title is #{driver.title}"
#
# #element = driver.find_element(id: 'lst-ib')
# element = driver.find_element :name => "q"
# #element.send_keys('Cricket')
# element.send_keys "Cricket"
# element.submit
#
# wait = Selenium::WebDriver::Wait.new(:timeout => 10)
# wait.until {driver.title.downcase.start_with? "cricket"}
#
# puts "Page title is #{driver.title}"

driver.quit 