require 'selenium-webdriver'
require 'rspec/expectations'
extend RSpec::Matchers
# if you use include Rspec::Matchers it wont work , will result in an exception

describe 'multi_windows' do

before(:each) do
  @driver = Selenium::WebDriver.for :firefox
end

after(:each) do
  @driver.quit
end

it 'succeeded' do
  @driver.get 'http://the-internet.herokuapp.com/windows'
  first_window = @driver.window_handle
  @driver.find_element(css: '.example a').click
  all_windows = @driver.window_handles
  new_window = all_windows.select {|this_window| this_window !=first_window}
  @driver.switch_to.window(first_window)
  #expect(@driver.title).not_to eql 'New Window'
  @driver.title.should_not == 'New Window'
  @driver.switch_to.window(new_window)
  #expect(@driver.title).to eql 'New Window'
  @driver.title.should == 'New Window' 
  
end

it 'failed' do
  @driver.get 'http://the-internet.herokuapp.com/windows'
  first_window = @driver.window_handle
  @driver.find_element(css: '.example a').click
  all_windows = @driver.window_handles
  new_window = all_windows.select {|this_window| this_window !=first_window}
  @driver.switch_to.window(first_window)
  #expect(@driver.title).not_to eql 'New Window'
  @driver.title.should_not == 'New Window'
  @driver.switch_to.window(new_window)
  #expect(@driver.title).to eql 'New Window'
  @driver.title.should == 'New Windowdcddss' 
  
end
  
end


