require 'selenium-webdriver'
require 'rspec/expectations'
extend RSpec::Matchers

describe 'Ghostdriver_basic_test' do

#def setup
before(:each) do
  @driver = Selenium::WebDriver.for :remote, url:'http://localhost:3555'
end

#def teardown
after(:each) do
  @driver.quit
end

#def run
 # setup
  #yield
  #teardown
  #end

#run do
it 'succeeded' do
  
  @driver.get 'http://the-internet.herokuapp.com'
  title_current = @driver.title
  #expect title_current.eql 'The Internet'
  #title_current.should == 'The Internet'
  
  #this will not give deprecation error in RSPEC ! 
  expect(title_current).to eql('The Internet')
end

end
