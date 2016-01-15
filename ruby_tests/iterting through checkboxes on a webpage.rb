# filename: checkboxes.rb
=begin
Load the page
Find all of the checkboxes
Assert that the last checkbox (the one that is supposed to be checked on page load) is checked
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
  teardown
end

run do 
@driver.get 'http://the-internet.herokuapp.com/checkboxes'
checkboxes = @driver.find_elements(css: 'input[type="checkbox"]')
#checkboxes.each {|a| print a}

# I have got no freaking idea as to why the below wont work without the .inspect
#The Ruby doc has got no description of what the .inspect does !?!
checkboxes.each {|a| puts a.attribute('checked').inspect}
checkboxes.each {|checkbox| puts checkbox.selected?.inspect}
#checkboxes.each {|a| puts a.enabled?}
#check that the last checkbox is selected
expect(checkboxes.last.selected?).to eql true
#alternatively, have to use quotes around true because the value returned is a string rather than a boolean
expect(checkboxes.last.attribute('checked')).to eql "true"
end



