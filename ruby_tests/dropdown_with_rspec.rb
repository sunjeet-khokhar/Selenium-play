require 'Selenium-Webdriver'
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
  @driver.get 'http://the-internet.herokuapp.com/dropdown'
  dropdown = @driver.find_element(id: 'dropdown')
  drop_down_sel_obj = Selenium::WebDriver::Support::Select.new(dropdown)
  #puts drop_down_sel_obj.multiple?
  drop_down_sel_obj.select_by(:text,'Option 1')
  selected_option = drop_down_sel_obj.selected_options[0].text
  expect(selected_option).to eql 'Option sddsd'
end

