require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers


  @driver = Selenium::WebDriver.for :firefox
  
  @driver.get 'http://the-internet.herokuapp.com/dropdown'

  #find eement called dropdown on the web page
  dropdown = @driver.find_element(id: 'dropdown')
  #use Webdriver API's Select class to create a new selection object and assign it a variable
  select_list = Selenium::WebDriver::Support::Select.new(dropdown)
  #select the text 'option1'
  select_list.select_by(:text, 'Option 1')
  #you can select by value as well
  # select_list.select_by(:value, '1')
  #what is the selected text ?
  selected_option = select_list.selected_options[0].text
  #some RSPEC crap i dont understand !
  expect(selected_option).to eql 'Option 1'
  #prints what was selected ?
  puts selected_option
  multi_sel = select_list.multiple?
  #print whether the drop down list supports multiple select options ?
  puts multi_sel
  #remeber to kill the browser ! 
  @driver.quit
  
 

  
