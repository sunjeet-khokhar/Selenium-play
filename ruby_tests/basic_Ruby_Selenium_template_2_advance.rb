# filename: basic_Ruby_Selenium_template.rb
=begin
This is a Selenium template which is more advanced than the basic one
We have use of elicit wait and exception handling
Also we have some experimental code that read,parses and outputs a csv file

=end

require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers
require 'csv'
require 'smarter_csv'

def setup
  @driver = Selenium::WebDriver.for :firefox
end

def teardown
  @driver.quit
end

def simple_parse
  #puts "in parse method"
  #user_data = CSV.read Dir.pwd + '/user_data.csv'
  #user_data_parsed = CSV.parse(user_data, :headers => true)
  #prints each row but I need parsing by columns into different arrays !!!
  #user_data_parsed.each {|row1| puts row1}
  #user_data_parsed_column = CSV.shift
  #user_data_parsed_column.each {|row2| puts row2}
  
  #user SmarterCSV GEM to parse the CSV and output an array of hashes
  #because I am using the SmarterCSV GEM i dont have to write the above code for parsing
  #just this one statement below gives me an array of hashes
  user_data = SmarterCSV.process('user_data.csv')
  puts user_data 
  user_data.each do |row| 
  puts row[:username]
  puts row[:password]
end
end


def run
  setup
  yield
  simple_parse
  teardown
end

#use of explicit wait
def notification_confirm
  wait = Selenium::WebDriver::Wait.new(timeout: 5)
  wait.until {
    @driver.find_element(id: 'flash-messages').displayed?
  }
end



 
run do

  @driver.get 'http://the-internet.herokuapp.com/login'
  @driver.find_element(id: 'username').send_keys('ddffdf')
  @driver.find_element(id: 'password').send_keys('sddcfd')
  @driver.find_element(id: 'login').submit
  #use of exception handling
  begin
    expect(notification_confirm).to eql true
    rescue Exception => error
    puts error.message 
  end
end
