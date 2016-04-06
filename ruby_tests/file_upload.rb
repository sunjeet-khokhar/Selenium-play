# filename: basic_Ruby_Selenium_template.rb
=begin
This is a bare bones Selenium test script, almost a template in Ruby
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
  file = 'upload.txt'
  to_upload = File.join(Dir.pwd, file)
  puts to_upload
  @driver.get 'http://the-internet.herokuapp.com/upload'
  #page_message = @driver.find_element(css: '.example p').text
  @driver.find_element(css: 'input#file-upload').send_keys to_upload
  @driver.find_element(id: 'file-upload').send_keys to_upload
  @driver.find_element(id: 'file-submit').click

end