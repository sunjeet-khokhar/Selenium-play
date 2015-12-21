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
  @driver.get 'http://the-internet.herokuapp.com/nested_frames'
  @driver.switch_to.frame('frame-top')
  @driver.switch_to.frame('frame-middle')
  #expect(@driver.find_element(:id,'content').text).to eql 'MIDDLEdffdf'
  # expect(@driver.find_element(:id,'content').text).not_to eql 'MIDDLEdffdf'
  @driver.get 'http://the-internet.herokuapp.com/tinymce'
  @driver.switch_to.frame('mce_0_ifr')
  element = @driver.find_element(:id,'tinymce')
  before_text = element.text
  element.clear
  element.send_keys 'this is an auto test'
  after_text = element.text
  expect(after_text).not_to eql before_text
  @driver.switch_to.default_content
    #expect(@driver.find_element(css: 'h3').text).not_to be_empty
    #expect(@driver.find_element(:css, 'h3').text).not_to be_empty
end



