# filename: basic_Ruby_Selenium_template.rb
=begin
This is an example of how to take screenshot using a rescue Ruby block of code
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
  begin
	yield
rescue RSpec::Expectations::ExpectationNotMetError => error
	puts error.message
	# save the screenshot file in the same folder as the ruby script
	
	@driver.save_screenshot 'screenshot.png'

	# screenshot variable stories the file name for the screenshot , time stamp is created 
	# using the strftime method
	screenshot = Time.now.strftime("failure screenshot__%d_%m_%Y__%H_%M_%S")

	#concatenate the variable to current working directory and file type 
	#@driver.save_screenshot ("./#{screenshot}.png")

    # my fav of concatenating ...find it simple to read and understand
	@driver.save_screenshot "./" + screenshot + ".png"
	
	# a more cryptic way to do the same thing , i dont prefer it because it is hard to decipher

	#@driver.save_screenshot  ("./#{Time.now.strftime("failure screenshot__%d_%m_%Y__%H_%M_%S")}.png")


end
  teardown
end


run do
  @driver.get 'http://admin:admin@the-internet.herokuapp.com/basic_auth'
  page_message = @driver.find_element(css: '.example p').text
  expect(page_message).to eql 'djdjhdjdCongratulations! You must have the proper credentials.'
end
