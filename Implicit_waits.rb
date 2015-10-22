require 'rubygems'
require 'selenium-webdriver'

my_driver = Selenium::WebDriver.for :firefox
my_driver.manage.timeouts.implicit_wait = 10 #seconds

my_driver.get "http://ted.com"
element = my_driver.find_element(:css => "div.home-main.main")
element_button = my_driver.find_element(:class => "spotlight-custom__button")
element_button.click()

#now use an explicit wait here and wait for an element to be loaded before quitting
#wait = Selenium::WebDriver::Wait.new(:timeout => 10)
#wait.until {my_driver.find_element(:css => "img.figure__imagebhbhjb")}

my_driver.quit


