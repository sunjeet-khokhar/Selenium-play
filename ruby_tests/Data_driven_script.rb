=begin
  
A data driven test that parses a csv file (using the SmarterCSV GEM)
for user names and passwords and expected text 
  and then compares it against what we get back from the AUT
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
  element = @driver.find_element(id: 'flash-messages')
  wait.until {
    element.displayed?
  }
  element.text.delete('^a-zA-z !.')
end


run do
  simple_parse.each do |user|
    @driver.get 'http://the-internet.herokuapp.com/login'
    @driver.find_element(id: 'username').send_keys user[:username]
    @driver.find_element(id: 'password').send_keys user[:password]
    @driver.find_element(id: 'login').submit
    #commented out the exception handling , letting Jenkins handle it by 
    #letting the test throw an excpetion and hence Jenkins build will fail 
    # if the exceptin is handled in this code Jenkins shell script will pass ;)
    #begin
      expect(notification_confirm).to eql user[:notification_message]
    #rescue Exception => e
     # puts e.message
    #end
  end
end
